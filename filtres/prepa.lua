--[[
Filtre Quarto/Pandoc de la prépa.

Blocs reconnus (divs Pandoc) :
  ::: {.encadre #id nature="Propriété" titre="..."}     encadré de théorie
      ::: exemple … :::
  ::: {.qcm #id source="Examen 2018" reponse="B" theorie="id1 id2"}
      énoncé
      ::: options   (liste de 4 items A, B, C, D)
      ::: indice    (indices 2 et 3 ; l'indice 1 renvoie à la théorie)
      ::: details   (solution détaillée)
      ::: pieges
  ::: {.qcm .jumeau jumeau-de="id"}   jumeau pour le ticket de sortie (dans ::: ticket)
  ::: {.qcm .exo}                      exercice en autoévaluation (dans ::: quiz)

Sorties : HTML (site) et Typst (PDF). Métadonnées de page :
  prepa:
    theme: algebre        (obligatoire sur les pages de thème)
    version: eleve|prof   (PDF : « prof » ajoute indices et solutions en annexe)
    impression: true      (PDF : tout en noir)
]]

local LETTRES = { "A", "B", "C", "D" }
local est_html = FORMAT:match("html") ~= nil
local est_typst = FORMAT:match("typst") ~= nil

local meta_theme, version_prof = "", false
local titres_theorie = {}
local annexe = {}         -- PDF prof : solutions
local reponses_exos = {}  -- PDF : grille des réponses des exercices
local num_question, num_exo = 0, 0

local function erreur(msg)
  io.stderr:write("[prepa] ERREUR : " .. msg .. "\n")
  error("prepa : " .. msg)
end
local function avert(msg) io.stderr:write("[prepa] " .. msg .. "\n") end

local function echap_html(s)
  return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end
local function echap_typst(s)
  return (s:gsub("([\\%*_#%[%]%$@<>`~])", "\\%1"))
end
local function html(s) return pandoc.RawBlock("html", s) end
local function typ(s) return pandoc.RawBlock("typst", s) end
local function inlines_md(s)
  local doc = pandoc.read(s or "", "markdown")
  if #doc.blocks == 0 then return pandoc.Inlines({}) end
  return doc.blocks[1].content
end
local function a_classe(el, c)
  for _, x in ipairs(el.classes) do if x == c then return true end end
  return false
end
local function ajouter(dest, blocs)
  for _, b in ipairs(blocs) do table.insert(dest, b) end
end

-- Titres, numéros et pages des encadrés de théorie du thème (pour l'indice 1).
-- La théorie d'un thème est répartie en chapitres : <thème>/NN-nom.qmd (NN = numéro du chapitre).
-- Les encadrés sont numérotés « thème.chapitre.n » (n compté par nature, dans chaque chapitre).
local numero_theme = "1"
local numero_chapitre = nil
local fichier_theorie = {}
local NUMEROS = { algebre = "1", geometrie = "2", trigonometrie = "3", analyse = "4", statistique = "5" }
local THEMES = { "algebre", "geometrie", "trigonometrie", "analyse", "statistique" }
-- Catégorie d'un exercice (verrou « exercices » de etat.json), d'après le préfixe de son identifiant
local CATEGORIES = { alge = "algebre", geo = "geometrie", tri = "trigonometrie", ana = "analyse", sta = "statistique", mel = "melange" }
local function categorie(id) return CATEGORIES[id:match("^(%a+)%-") or ""] or meta_theme end
-- prefixe : chemin du dossier du thème vu depuis la page ("" sur une page du thème, "../algebre/" ailleurs)
local function charger_theorie(theme, prefixe)
  prefixe = prefixe or ""
  local num = NUMEROS[theme] or numero_theme
  local racine = (quarto and quarto.project and quarto.project.directory) or "."
  local dossier = racine .. "/" .. theme
  local fichiers = {}
  for _, nom in ipairs(pandoc.system.list_directory(dossier)) do
    if nom:match("^%d+%-.*%.qmd$") then table.insert(fichiers, nom) end
  end
  table.sort(fichiers)
  for _, nom in ipairs(fichiers) do
    local f = io.open(dossier .. "/" .. nom, "r")
    if f then
      local chap = tonumber(nom:match("^(%d+)"))
      local compte = {}
      for ligne in f:lines() do
        if ligne:match("^:::+%s*{.*%.encadre") then
          local id = ligne:match("#([%w%-_]+)")
          local titre = ligne:match('titre="([^"]*)"') or ""
          local nature = ligne:match('nature="([^"]*)"') or "Propriété"
          compte[nature] = (compte[nature] or 0) + 1
          if id then
            titres_theorie[id] = nature .. " " .. num .. "." .. chap .. "." .. compte[nature] .. (titre ~= "" and (" — " .. titre) or "")
            fichier_theorie[id] = prefixe .. nom
          end
        end
      end
      f:close()
    end
  end
end

-- Décompose un div .qcm en ses parties
local function decomposer(div)
  local p = { enonce = {}, options = nil, indices = {}, details = nil, pieges = nil }
  for _, b in ipairs(div.content) do
    if b.t == "Div" and a_classe(b, "options") then
      for _, bb in ipairs(b.content) do
        if bb.t == "BulletList" or bb.t == "OrderedList" then p.options = bb.content end
      end
    elseif b.t == "Div" and a_classe(b, "indice") then
      table.insert(p.indices, b.content)
    elseif b.t == "Div" and a_classe(b, "details") then
      p.details = b.content
    elseif b.t == "Div" and a_classe(b, "pieges") then
      p.pieges = b.content
    elseif not (b.t == "RawBlock" and b.text:match("^%s*<!%-%-")) then
      table.insert(p.enonce, b)
    end
  end
  return p
end

local function premier_inlines(blocs)
  -- contenu inline d'un item de liste (Plain/Para)
  local r = pandoc.Inlines({})
  for _, b in ipairs(blocs) do
    if b.t == "Plain" or b.t == "Para" then r:extend(b.content) end
  end
  return r
end

local function renvoi_theorie(ids)
  local inl = pandoc.Inlines({ pandoc.Str("Revois"), pandoc.Space(), pandoc.Str(":"), pandoc.Space() })
  for i, id in ipairs(ids) do
    local titre = titres_theorie[id]
    if not titre then erreur("renvoi vers une théorie inconnue : " .. id) end
    if i > 1 then inl:extend({ pandoc.Str(";"), pandoc.Space() }) end
    inl:insert(pandoc.Link(inlines_md(titre), fichier_theorie[id] .. "#" .. id))
  end
  inl:insert(pandoc.Str("."))
  return { pandoc.Para(inl) }
end

local function solution_blocs(p, reps, annulee)
  local idx = { A = 1, B = 2, C = 3, D = 4 }
  if annulee then
    local lettres = table.concat(reps, " et ")
    local texte = "**Question annulée.** Les propositions " .. lettres .. " sont toutes correctes alors qu'une seule réponse est attendue : l'énoncé contient une erreur. " ..
      "Cela arrive au concours ; dans ce cas, la question est annulée pour le concours."
    return pandoc.Para(inlines_md(texte))
  end
  local rep = reps[1]
  local ligne = pandoc.Inlines({ pandoc.Str("Réponse"), pandoc.Space(), pandoc.Str(":"), pandoc.Space(),
    pandoc.Strong({ pandoc.Str(rep) }), pandoc.Space(), pandoc.Str("—"), pandoc.Space() })
  ligne:extend(premier_inlines(p.options[idx[rep]]))
  return pandoc.Para(ligne)
end

-- ------------------------------------------------------------------ QCM

local function qcm(div)
  local id = div.identifier
  local source = div.attributes["source"]
  local rep = div.attributes["reponse"]
  local jumeau = a_classe(div, "jumeau")
  local exo = a_classe(div, "exo")
  if id == "" then erreur("QCM sans identifiant") end
  if not source or source == "" then erreur(id .. " : attribut source manquant (année d'examen ou « Prépa UMONS »)") end
  local reps = {}
  for L in (rep or ""):gmatch("%S+") do
    if not L:match("^[ABCD]$") then erreur(id .. " : reponse invalide (" .. L .. ")") end
    table.insert(reps, L)
  end
  local annulee = div.attributes["annulee"] == "true"
  if #reps == 0 then erreur(id .. " : reponse manquante") end
  if #reps > 1 and not annulee then erreur(id .. " : plusieurs réponses sans annulee=\"true\"") end
  if exo and #reps > 1 then erreur(id .. " : un exercice en autoévaluation n'a qu'une réponse") end
  local p = decomposer(div)
  if not p.options or #p.options ~= 4 then erreur(id .. " : il faut exactement 4 options") end
  local ids_theorie = {}
  for t in (div.attributes["theorie"] or ""):gmatch("%S+") do table.insert(ids_theorie, t) end

  local titre
  if exo then num_exo = num_exo + 1; titre = "Exercice " .. num_exo
  elseif jumeau then titre = est_typst and ("Jumeau de " .. (div.attributes["jumeau-de"] or "?")) or "Ticket"
  else num_question = num_question + 1; titre = "Question " .. num_question end

  -- ---------- HTML (balisage des sites de cours : .exo, .exo-tete, .exo-corps, .aides)
  if est_html then
    local corps = {}
    ajouter(corps, p.enonce)
    local opts = {}
    for i, item in ipairs(p.options) do
      local L = LETTRES[i]
      if exo then
        table.insert(opts, html('<label class="qcm-option" data-lettre="' .. L .. '"><input type="radio" name="' .. echap_html(id) ..
          '" value="' .. L .. '"><span class="qcm-lettre">' .. L .. '</span><span>'))
        table.insert(opts, pandoc.Plain(premier_inlines(item)))
        table.insert(opts, html("</span></label>"))
      else
        local inl = pandoc.Inlines({ pandoc.Span({ pandoc.Str(L) }, pandoc.Attr("", { "qcm-lettre" })) })
        inl:insert(pandoc.Span(premier_inlines(item)))
        table.insert(opts, pandoc.Div({ pandoc.Plain(inl) }, pandoc.Attr("", { "qcm-option" }, { ["data-lettre"] = L })))
      end
    end
    table.insert(corps, pandoc.Div(opts, pandoc.Attr("", { "qcm-options" })))
    if exo then table.insert(corps, html('<p class="verdict" hidden></p>')) end

    local tete = pandoc.Para({
      pandoc.Span({ pandoc.Str("✎ " .. titre) }, pandoc.Attr("", { "exo-titre" })), pandoc.Space(),
      pandoc.Span({ pandoc.Str(source) }, pandoc.Attr("", { "exo-source" })) })
    local attrs = { ["data-source"] = source }
    local cat = exo and categorie(id) or nil
    if exo then attrs["data-reponse"] = rep; attrs["data-categorie"] = cat end
    local contenu_boite = { pandoc.Div({ tete }, pandoc.Attr("", { "exo-tete" })),
                            pandoc.Div(corps, pandoc.Attr("", { "exo-corps" })) }
    local boite = pandoc.Div(contenu_boite,
                             pandoc.Attr(id, exo and { "exo", "qcm", "qcm-exo" } or { "exo", "qcm" }, attrs))
    local b = { boite }

    -- Aides : sous chaque question de séance ; dans la boîte d'un exercice (qui peut être déplacé par le tirage),
    -- seulement s'il a des indices ou une solution détaillée.
    local avec_aides = not exo or #ids_theorie > 0 or #p.indices > 0 or p.details ~= nil
    if avec_aides then
      local onglets = {}
      local function onglet(nom, blocs)
        table.insert(onglets, pandoc.Header(2, { pandoc.Str(nom) }, pandoc.Attr("", { "unlisted" })))
        ajouter(onglets, blocs)
      end
      local function verrou(blocs)
        local v = exo and "exercices" or (jumeau and "ticket_solutions" or "solutions")
        local att = { ["data-verrou"] = v, ["data-id"] = id }
        if exo then att["data-categorie"] = cat end
        local attente = exo and "Correction bientôt disponible."
                         or (meta_theme == "mise-en-situation" and "Le correctif sera publié après l'épreuve."
                             or "La solution sera disponible à la fin de la phase d'entraînement.")
        return { pandoc.Div({
          pandoc.Div({ pandoc.Para({ pandoc.Str(attente) }) }, pandoc.Attr("", { "verrou-attente" })),
          pandoc.Div(blocs, pandoc.Attr("", { "verrou-contenu" }, { hidden = "" })) },
          pandoc.Attr("", { "verrou" }, att)) }
      end
      local k = 0
      if #ids_theorie > 0 then k = k + 1; onglet("Indice " .. k, renvoi_theorie(ids_theorie)) end
      for _, ind in ipairs(p.indices) do k = k + 1; onglet("Indice " .. k, ind) end
      local sol = { pandoc.Div({ solution_blocs(p, reps, annulee) }, pandoc.Attr("", { "reponse" })) }
      if p.details then
        table.insert(sol, html('<details class="tw-details"><summary>Je veux plus de détails</summary>'))
        table.insert(sol, pandoc.Div(p.details, pandoc.Attr("", { "tw-expl" })))
        table.insert(sol, html("</details>"))
      end
      onglet("Solution", verrou(sol))
      if p.pieges then onglet("Pièges", verrou(p.pieges)) end
      local aides = pandoc.Div({ pandoc.Div(onglets, pandoc.Attr("", { "panel-tabset" })) }, pandoc.Attr("", { "aides" }))
      if exo then table.insert(boite.content, aides) else table.insert(b, aides) end
    end
    if jumeau then
      return { pandoc.Div(b, pandoc.Attr("", { "jumeau" }, { ["data-jumeau-de"] = div.attributes["jumeau-de"] or "", hidden = "" })) }
    end
    return b
  end

  -- ---------- Typst
  if est_typst then
    if jumeau and not version_prof then return {} end
    local b = {}
    table.insert(b, typ('#qcm(titre: [' .. titre .. '], source: [' .. echap_typst(source) .. '])['))
    ajouter(b, p.enonce)
    table.insert(b, typ("#options("))
    for i, item in ipairs(p.options) do
      table.insert(b, typ("["))
      table.insert(b, pandoc.Plain(premier_inlines(item)))
      table.insert(b, typ(i < 4 and "]," or "]"))
    end
    table.insert(b, typ(")"))
    table.insert(b, typ("]"))
    if exo then
      table.insert(reponses_exos, { titre = titre, rep = rep })
    elseif version_prof then
      local a = {}
      table.insert(a, typ('#solution(titre: [' .. titre .. '], source: [' .. echap_typst(source) .. '])['))
      for k, ind in ipairs(p.indices) do
        table.insert(a, pandoc.Para({ pandoc.Emph({ pandoc.Str("Indice " .. (k + 1) .. " :") }) }))
        ajouter(a, ind)
      end
      table.insert(a, solution_blocs(p, reps, annulee))
      if p.details then ajouter(a, p.details) end
      if p.pieges then
        table.insert(a, pandoc.Para({ pandoc.Emph({ pandoc.Str("Pièges") }) }))
        ajouter(a, p.pieges)
      end
      table.insert(a, typ("]"))
      table.insert(annexe, a)
    end
    return b
  end
  return nil
end

-- ------------------------------------------------------------------ autres blocs

local compte_nature = {}
local function encadre(div)
  local nature = div.attributes["nature"] or "Propriété"
  local titre = div.attributes["titre"] or ""
  compte_nature[nature] = (compte_nature[nature] or 0) + 1
  local etiquette = nature .. " " .. numero_theme .. "." .. (numero_chapitre and (numero_chapitre .. ".") or "") .. compte_nature[nature]
  local sorte = ({ ["Définition"] = "definition", ["Propriété"] = "propriete", ["Exemple"] = "exemple",
                   ["Remarque"] = "remarque", ["Méthode"] = "propriete", ["À retenir"] = "aretenir" })[nature] or "propriete"
  if est_html then
    local head = pandoc.Inlines({ pandoc.Strong({ pandoc.Str(etiquette) }) })
    if titre ~= "" then head:extend({ pandoc.Space(), pandoc.Str("—"), pandoc.Space() }); head:extend(inlines_md(titre)) end
    return { pandoc.Div({ pandoc.Div({ pandoc.Para(head) }, pandoc.Attr("", { "theo-head" })),
                          pandoc.Div(div.content, pandoc.Attr("", { "theo-body" })) },
                        pandoc.Attr(div.identifier, { "theo", "theo-" .. sorte }, { ["data-sorte"] = sorte })) }
  elseif est_typst then
    local b
    if titre ~= "" then
      b = { typ('#encadre(sorte: "' .. sorte .. '", nature: [' .. echap_typst(etiquette) .. '], titre: [') }
      table.insert(b, pandoc.Plain(inlines_md(titre)))
      table.insert(b, typ("])["))
    else
      b = { typ('#encadre(sorte: "' .. sorte .. '", nature: [' .. echap_typst(etiquette) .. '])[') }
    end
    ajouter(b, div.content)
    table.insert(b, typ("]"))
    return b
  end
end

local function exemple(div)
  if est_html then
    return { pandoc.Div({ pandoc.Div({ pandoc.Para({ pandoc.Strong({ pandoc.Str("Exemple") }) }) }, pandoc.Attr("", { "theo-head" })),
                          pandoc.Div(div.content, pandoc.Attr("", { "theo-body" })) },
                        pandoc.Attr("", { "theo", "theo-exemple" })) }
  elseif est_typst then
    local b = { typ("#exemple[") }
    ajouter(b, div.content)
    table.insert(b, typ("]"))
    return b
  end
end

local function ticket(div)
  if est_html then
    local b = { html('<section id="ticket" class="ticket" hidden><h2 class="unlisted">Ticket de sortie</h2>' ..
      '<p>Réponds dans Wooclap ou Moodle à la question indiquée par l\'enseignant.</p>') }
    ajouter(b, div.content)
    table.insert(b, html("</section>"))
    return b
  elseif est_typst then
    if not version_prof then return {} end
    local b = { pandoc.Header(2, { pandoc.Str("Ticket de sortie (jumeaux)") }) }
    ajouter(b, div.content)
    return b
  end
end

local function quiz(div)
  if est_html then
    local tirage = div.attributes["tirage"]
    local b = { html('<form class="quiz"' .. (tirage and (' data-tirage="' .. echap_html(tirage) .. '"') or '') .. '>') }
    ajouter(b, div.content)
    table.insert(b, html('<div class="actions-quiz"><button type="button" class="corriger">Corriger</button>' ..
      (tirage and '<button type="button" class="nouvelle-serie">Nouvelle série</button>' or '') ..
      '<button type="button" class="recommencer" hidden>Recommencer</button><p class="score" hidden></p>' ..
      '<p class="attente-quiz" hidden>Correction bientôt disponible.</p></div></form>'))
    return b
  end
  return div.content
end

-- ------------------------------------------------------------------

function Pandoc(doc)
  local prepa = doc.meta.prepa or {}
  meta_theme = prepa.theme and pandoc.utils.stringify(prepa.theme) or ""
  version_prof = prepa.version and pandoc.utils.stringify(prepa.version) == "prof"
  local impression = prepa.impression ~= nil and pandoc.utils.stringify(prepa.impression) == "true"
  numero_theme = prepa.numero and pandoc.utils.stringify(prepa.numero) or NUMEROS[meta_theme] or "1"
  numero_chapitre = prepa.chapitre and pandoc.utils.stringify(prepa.chapitre) or nil
  if NUMEROS[meta_theme] then
    charger_theorie(meta_theme)
  elseif meta_theme ~= "" then
    -- mélange, autoévaluation globale : renvois vers la théorie de tous les thèmes
    for _, th in ipairs(THEMES) do charger_theorie(th, "../" .. th .. "/") end
  end

  doc = doc:walk({
    RawBlock = function(r)
      if r.format == "html" and r.text:match("^%s*<!%-%-") then return {} end
    end,
    Math = function(m)
      if not est_typst then return nil end
      -- Typst : intervalles « ]a;b[ » et virgule décimale
      local t = m.text:gsub("\\left%s*([%[%]])", "%1"):gsub("\\right%s*([%[%]])", "%1")
      t = t:gsub("{,}", "\\text{,}")
      -- Typst : normes ‖…‖ (pandoc traduit mal \| et \left\|)
      t = t:gsub("\\left\\|", "\\|"):gsub("\\right\\|", "\\|")
      local morceaux, ouvert, pos = {}, true, 1
      while true do
        local i = t:find("\\|", pos, true)
        if not i then table.insert(morceaux, t:sub(pos)); break end
        table.insert(morceaux, t:sub(pos, i - 1) .. (ouvert and "\\lVert " or "\\rVert "))
        ouvert = not ouvert
        pos = i + 2
      end
      t = table.concat(morceaux)
      m.text = t
      -- Limites : « x → a » sous « lim » (et l'inégalité au-dessus de la flèche), même dans le texte
      if t:match("\\lim") or t:match("\\overset") or t:match("\\stackrel") then
        local out = pandoc.write(pandoc.Pandoc({ pandoc.Plain({ m }) }), "typst")
        out = out:gsub("%s+$", "")
        out = out:gsub("lim_", "limits(lim)_"):gsub("arrow%.r%^", "limits(arrow.r)^")
        return pandoc.RawInline("typst", out)
      end
      return m
    end,
    Para = function(para)
      -- Figure de théorie : ![](…){.th}, centrée et agrandie (le SVG fait sa taille naturelle en pt)
      if #para.content == 1 and para.content[1].t == "Image" and para.content[1].classes:includes("th") then
        local img = para.content[1]
        local racine = (quarto and quarto.project and quarto.project.directory) or "."
        local fichier = racine .. "/" .. img.src:gsub("^%.%./", "")
        local f = io.open(fichier, "r")
        local largeur = nil
        if f then
          local tete = f:read(400) or ""
          f:close()
          largeur = tonumber(tete:match('width="([%d%.]+)pt"'))
        end
        if est_typst then
          if largeur then img.attributes["width"] = string.format("%.0fpt", math.min(largeur * 1.2, 470)) end
          return { typ("#align(center)["), para, typ("]") }
        elseif est_html and largeur then
          img.attributes["style"] = string.format("width: %.0fpx;", largeur * 4 / 3 * 1.6)
          return para
        end
      end
    end,
    Div = function(div)
      if a_classe(div, "qcm") then return qcm(div)
      elseif a_classe(div, "encadre") then return encadre(div)
      elseif a_classe(div, "exemple") then return exemple(div)
      elseif a_classe(div, "ticket") then return ticket(div)
      elseif a_classe(div, "quiz") then return quiz(div)
      end
    end,
  })

  if est_html and meta_theme ~= "" then
    table.insert(doc.blocks, 1, html('<div id="prepa-meta" data-theme="' .. echap_html(meta_theme) .. '" data-racine="../" hidden></div>'))
  end

  if est_typst then
    table.insert(doc.blocks, 1, typ("#prepa-impression.update(" .. tostring(impression) .. ")"))
    if #reponses_exos > 0 then
      table.insert(doc.blocks, typ("#pagebreak()"))
      table.insert(doc.blocks, pandoc.Header(2, { pandoc.Str("Réponses") }))
      local cellules = {}
      for _, r in ipairs(reponses_exos) do
        table.insert(cellules, "[" .. r.titre .. "], [*" .. r.rep .. "*]")
      end
      table.insert(doc.blocks, typ("#grille-reponses(" .. table.concat(cellules, ", ") .. ")"))
    end
    if #annexe > 0 then
      table.insert(doc.blocks, typ("#pagebreak()"))
      table.insert(doc.blocks, pandoc.Header(2, { pandoc.Str("Indices et solutions") }))
      for _, a in ipairs(annexe) do ajouter(doc.blocks, a) end
    end
  end
  return doc
end

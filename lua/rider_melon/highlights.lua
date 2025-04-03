-- Applies highlight groups using a given color palette

local M = {}

-- Helper function to define highlights safely
local function hi(group, style)
  if not style then return end
  if next(style) ~= nil then -- Ensure table is not empty
     pcall(vim.api.nvim_set_hl, 0, group, style)
  end
end

-- Main function to set highlights
function M.load(colors)
  if not colors then
    print("Error: No color palette provided to highlights.load")
    return
  end

  -- Clear existing highlights before applying new ones
  -- This should ideally be done once in the main theme load function,
  -- but doing it here ensures safety if called directly.
  -- vim.cmd.hi('clear')
  -- if vim.g.colors_name then vim.cmd.hi('clear') end

  -- Base terminal appearance
  hi('Normal',        { fg = colors.fg, bg = colors.bg })
  hi('NormalNC',      { fg = colors.fg, bg = colors.bg })
  hi('NormalFloat',    { fg = colors.fg, bg = colors.info_bg })
  hi('FloatBorder',    { fg = colors.border, bg = colors.info_bg })
  hi('MsgArea',       { fg = colors.fg, bg = colors.bg })

  -- UI Elements (Statusline, Sidebar, etc.)
  hi('StatusLine',    { fg = colors.fg_grey, bg = colors.border, style = 'NONE' })
  hi('StatusLineNC',  { fg = colors.comment, bg = colors.border, style = 'NONE' })
  hi('WinSeparator',   { fg = colors.border, bg = colors.bg })
  hi('EndOfBuffer',   { fg = colors.bg })
  hi('SignColumn',    { fg = colors.line_nr, bg = colors.gutter_bg })
  hi('FoldColumn',    { fg = colors.comment, bg = colors.gutter_bg })
  hi('LineNr',        { fg = colors.line_nr, bg = colors.gutter_bg })
  hi('CursorLineNr',  { fg = colors.line_nr, bg = colors.cursor_line_bg, style = 'bold' })
  hi('CursorLine',    { bg = colors.cursor_line_bg, style = 'NONE' })
  hi('CursorColumn',  { bg = colors.cursor_line_bg, style = 'NONE' })
  hi('ColorColumn',   { bg = colors.border })
  hi('Visual',        { bg = colors.selection_bg })
  hi('VisualNOS',     { bg = colors.selection_bg })
  hi('Search',        { bg = colors.search_bg, fg = colors.fg_grey })
  hi('IncSearch',     { bg = colors.inc_search_bg, fg = colors.fg_grey })
  hi('CurSearch',     { link = 'IncSearch' })
  hi('MatchParen',    { bg = colors.match_paren_bg, style = 'bold' })
  hi('Folded',        { fg = colors.info_fg, bg = colors.info_bg })
  hi('Whitespace',    { fg = colors.border })
  hi('NonText',       { fg = colors.border })
  hi('SpecialKey',    { fg = colors.border })

  -- Diagnostics
  hi('ErrorMsg',      { fg = colors.error_fg, bg = colors.error_bg, style = 'bold' })
  hi('WarningMsg',    { fg = colors.warning_fx, bg = colors.bg, style = 'bold' })
  hi('DiagnosticError', { fg = colors.error_fg })
  hi('DiagnosticWarn',  { fg = colors.warning_fx })
  hi('DiagnosticInfo',  { fg = colors.keyword })
  hi('DiagnosticHint',  { fg = colors.comment })
  hi('DiagnosticUnderlineError', { style = 'undercurl', sp = colors.error_fg })
  hi('DiagnosticUnderlineWarn',  { style = 'undercurl', sp = colors.warning_fx })
  hi('DiagnosticUnderlineInfo',  { style = 'underline', sp = colors.keyword })
  hi('DiagnosticUnderlineHint',  { style = 'underline', sp = colors.comment })

  -- Link LspDiagnostics to Diagnostic groups (common practice)
  hi('LspDiagnosticsDefaultError', { link = 'DiagnosticError' })
  hi('LspDiagnosticsDefaultWarning', { link = 'DiagnosticWarn' })
  hi('LspDiagnosticsDefaultInformation', { link = 'DiagnosticInfo' })
  hi('LspDiagnosticsDefaultHint', { link = 'DiagnosticHint' })
  hi('LspDiagnosticsUnderlineError', { link = 'DiagnosticUnderlineError' })
  hi('LspDiagnosticsUnderlineWarning', { link = 'DiagnosticUnderlineWarn' })
  hi('LspDiagnosticsUnderlineInformation', { link = 'DiagnosticUnderlineInfo' })
  hi('LspDiagnosticsUnderlineHint', { link = 'DiagnosticUnderlineHint' })

  -- Diffs
  hi('DiffAdd',       { bg = colors.diff_add_bg })
  hi('DiffChange',    { bg = colors.diff_mod_bg })
  hi('DiffDelete',    { bg = colors.diff_del_bg })
  hi('DiffText',      { bg = colors.diff_mod_txt_bg, fg = colors.diff_text_fg })
  hi('diffAdded',     { fg = colors.variable })
  hi('diffRemoved',   { fg = colors.diff_del_fg })
  hi('diffChanged',   { fg = colors.keyword })
  hi('diffFile',      { fg = colors.type, style = 'bold' })
  hi('diffLine',      { fg = colors.border })
  hi('DiffConflict',  { bg = colors.diff_conflict_bg })

  -- Popups and Completion Menu
  hi('Pmenu',         { fg = colors.fg, bg = colors.info_bg })
  hi('PmenuSel',      { fg = colors.fg, bg = colors.selection_bg })
  hi('PmenuSbar',     { bg = colors.border })
  hi('PmenuThumb',    { bg = colors.comment })
  hi('CmpItemKind',   { fg = colors.comment })
  hi('CmpItemAbbr',   { fg = colors.fg })
  hi('CmpItemAbbrDeprecated', { fg = colors.comment, style = 'strikethrough' })
  hi('CmpItemAbbrMatch', { fg = colors.keyword, style = 'bold' })
  hi('CmpItemAbbrMatchFuzzy', { fg = colors.keyword, style = 'bold' })

  -- Indentation Guides
  hi('IndentBlanklineChar',           { fg = colors.indent_guide, nocombine = true })
  hi('IndentBlanklineContextChar',    { fg = colors.indent_guide_active, nocombine = true })
  hi('IndentBlanklineContextStart',   { sp = colors.indent_guide_active, style = 'bold', nocombine = true })

  -- Tree-sitter Highlight Groups
  hi('@text',              { fg = colors.fg })
  hi('@text.strong',       { style = 'bold' })
  hi('@text.emphasis',     { style = 'italic' })
  hi('@text.underline',    { style = 'underline' })
  hi('@text.strike',       { style = 'strikethrough', sp = colors.warning_fx })
  hi('@text.title',        { fg = colors.func, style = 'bold' })
  hi('@text.literal',      { link = '@string' })
  hi('@text.uri',          { fg = colors.keyword, style = 'underline' })

  hi('@comment',           { fg = colors.comment, style = 'italic' })
  hi('@comment.error',     { fg = colors.error_fg, style = 'bold,italic' })
  hi('@comment.warning',   { fg = colors.warning_fx, style = 'bold,italic' })
  hi('@comment.todo',      { fg = colors.todo_fg, bg = colors.info_bg, style = 'bold,italic' })

  local punctuation_style = (vim.o.background == 'dark') and 'bold' or nil
  hi('@punctuation',       { fg = colors.fg_grey, style = punctuation_style })
  hi('@punctuation.delimiter', { fg = colors.fg_grey, style = punctuation_style })
  hi('@punctuation.bracket', { fg = colors.fg_grey, style = punctuation_style })
  hi('@punctuation.special',{ fg = colors.regex })

  local constant_style = (vim.o.background == 'dark') and 'bold' or nil
  hi('@constant',          { fg = colors.constant, style = constant_style })
  hi('@constant.builtin',  { fg = colors.constant, style = constant_style })
  hi('@constant.macro',    { fg = colors.preproc })

  hi('@string',            { fg = colors.string })
  hi('@string.escape',     { fg = colors.string_escape })
  hi('@string.regex',      { fg = colors.regex, bg = (vim.o.background == 'dark') and colors.border or nil })
  hi('@string.special',    { fg = colors.regex })

  hi('@character',         { fg = colors.string })
  hi('@character.special', { fg = colors.regex })

  hi('@number',            { fg = colors.number })
  hi('@boolean',           { fg = colors.keyword })
  hi('@float',             { fg = colors.number })

  hi('@type',              { fg = colors.type })
  hi('@type.builtin',      { fg = colors.type, style = 'bold' })
  hi('@type.definition',   { fg = colors.type })
  hi('@type.interface',    { link = '@type' })
  hi('@type.enum',         { link = '@type' })
  hi('@type.struct',       { link = '@type' })
  hi('@type.parameter',    { fg = colors.type })

  hi('@attribute',         { fg = colors.attribute })
  hi('@property',          { fg = colors.property })

  hi('@function',          { fg = colors.func })
  hi('@function.builtin',  { fg = colors.func, style = 'bold' })
  hi('@function.call',     { fg = colors.func })
  hi('@function.macro',    { fg = colors.preproc })
  hi('@function.static',   { link = '@function' })
  hi('@method',            { link = '@function'})

  hi('@keyword',           { fg = colors.keyword })
  hi('@keyword.function',  { fg = colors.keyword })
  hi('@keyword.operator',  { fg = colors.operator, style = 'NONE' })
  hi('@keyword.conditional',{ fg = colors.keyword })
  hi('@keyword.repeat',    { fg = colors.keyword })
  hi('@keyword.import',    { fg = colors.keyword })
  hi('@keyword.storage',   { fg = colors.keyword })
  hi('@keyword.exception', { fg = colors.keyword })

  hi('@operator',          { fg = colors.operator })

  hi('@variable',          { fg = colors.variable })
  hi('@variable.builtin',  { fg = colors.variable, style = 'bold' })
  hi('@variable.parameter',{ fg = colors.parameter })
  hi('@variable.global',   { fg = colors.variable })

  local label_style = (vim.o.background == 'dark') and 'bold' or nil
  hi('@label',             { fg = colors.label, style = label_style })

  hi('@tag',               { fg = colors.tag })
  hi('@tag.attribute',     { fg = colors.attribute })
  hi('@tag.delimiter',     { fg = colors.fg_grey })

  hi('@namespace',         { fg = colors.preproc })
  hi('@module',            { link = '@namespace' })

  hi('@constructor',       { fg = colors.type })
  hi('@class',             { link = '@type' })
  hi('@interface',         { link = '@type' })
  hi('@struct',            { link = '@type' })
  hi('@enum',              { link = '@type' })

  hi('@field',             { fg = colors.attribute })
  hi('@property',          { link = '@field'}) -- Link general property to field color

  hi('@parameter',         { link = '@variable.parameter'})

  hi('@error',             { fg = colors.error_fg })

  -- Standard Vim group fallbacks
  hi('Comment', { link = '@comment' })
  hi('String', { link = '@string' })
  hi('Number', { link = '@number' })
  hi('Keyword', { link = '@keyword' })
  hi('Function', { link = '@function' })
  hi('Type', { link = '@type' })
  hi('Constant', { link = '@constant' })
  hi('Operator', { link = '@operator' })
  hi('Statement', { link = '@keyword' })
  hi('PreProc', { link = '@constant.macro' })
  hi('Identifier', { link = '@variable' })
  hi('Special', { link = '@character.special' })
  hi('Error', { link = 'DiagnosticError' })
  hi('Todo', { link = '@comment.todo' })
  hi('Underlined', { link = '@text.underline' })
  hi('Title', { link = '@text.title' })
  hi('Delimiter', { link = '@punctuation.delimiter' })
  hi('Conditional', { link = '@keyword.conditional' })
  hi('Repeat', { link = '@keyword.repeat' })
  hi('Label', { link = '@label' })
  hi('Exception', { link = '@keyword.exception' })
  hi('Include', { link = '@keyword.import' })
  hi('Define', { link = '@keyword.import' })
  hi('Macro', { link = '@function.macro' })
  hi('Boolean', { link = '@boolean' })
  hi('Float', { link = '@float' })
  hi('Character', { link = '@character' })
end

return M

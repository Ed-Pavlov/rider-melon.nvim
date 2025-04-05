-- Applies terminal colors using a given palette

local M = {}

function M.load(colors)
  if not colors then return end

  if vim.fn.has('termguicolors') and vim.o.termguicolors then
    vim.g.terminal_color_0 = colors.term_black
    vim.g.terminal_color_1 = colors.term_red
    vim.g.terminal_color_2 = colors.term_green
    vim.g.terminal_color_3 = colors.term_yellow
    vim.g.terminal_color_4 = colors.term_blue
    vim.g.terminal_color_5 = colors.term_magenta
    vim.g.terminal_color_6 = colors.term_cyan
    vim.g.terminal_color_7 = colors.term_white
    vim.g.terminal_color_8 = colors.term_br_black
    vim.g.terminal_color_9 = colors.term_br_red
    vim.g.terminal_color_10 = colors.term_br_green
    vim.g.terminal_color_11 = colors.term_br_yellow
    vim.g.terminal_color_12 = colors.term_br_blue
    vim.g.terminal_color_13 = colors.term_br_magenta
    vim.g.terminal_color_14 = colors.term_br_cyan
    vim.g.terminal_color_15 = colors.term_br_white

    -- Optional: Explicitly set terminal background/foreground
    -- vim.g.terminal_color_background = colors.bg
    -- vim.g.terminal_color_foreground = colors.fg
  end
end

return M

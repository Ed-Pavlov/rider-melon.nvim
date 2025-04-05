# Rider Melon for Neovim

![rider-melon-logo](...) A Neovim theme inspired by the Rider Melon Light and Dark themes from JetBrains Rider IDE.

![Screenshot Light](...)
![Screenshot Dark](...)

## ✨ Features

* Light and Dark modes, automatically selected based on `&background`.
* Support for common Neovim UI elements.
* Tree-sitter syntax highlighting support.
* Terminal colors included.
* *Add more features as you develop them (e.g., plugin integrations)*

## 📋 Requirements

* Neovim >= 0.8.0 (recommended for latest highlight groups)
* `termguicolors` enabled (`vim.o.termguicolors = true`)

## 📦 Installation

Install using your favorite package manager.

**[Lazy.nvim](https://github.com/folke/lazy.nvim)**
```lua
{
  "Ed-Pavlov/rider-melon.nvim",
  lazy = false,
  priority = 1000, -- Ensure it loads early to apply the theme
  config = function()
    -- Load the colorscheme here.
    vim.cmd.colorscheme 'rider-melon'

    -- You can configure highlights by overriding the setup function,
    -- but for simple theme loading, just setting colorscheme is enough.
  end,
}

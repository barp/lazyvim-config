# Neovim Configuration (LazyVim)

Personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## What's included

- **Languages**: Go (gopls with codelens), Python (pyright + ruff), TypeScript (typescript-tools.nvim), JSON, TOML, Markdown
- **AI**: GitHub Copilot
- **UI**: Transparent background, scroll animations disabled, absolute line numbers
- **Plugins**: USH.nvim, transparent.nvim

## Prerequisites

Install the following before proceeding:

### Neovim >= 0.10.0

```bash
# Arch
sudo pacman -S neovim

# Ubuntu/Debian
# See https://github.com/neovim/neovim/blob/master/INSTALL.md

# macOS
brew install neovim
```

### Required dependencies

```bash
# Arch
sudo pacman -S git gcc make ripgrep fd lazygit

# Ubuntu/Debian
sudo apt install git gcc make ripgrep fd-find
# lazygit: https://github.com/jesseduffield/lazygit#installation

# macOS
brew install git gcc make ripgrep fd lazygit
```

### Optional (for configured language servers)

Mason will auto-install LSP servers on first launch, but the language toolchains themselves must be present:

```bash
# Go
# https://go.dev/dl/

# Python
# Ensure python3 and pip are available

# Node.js (for TypeScript and many LSP servers)
# https://nodejs.org/ or use a version manager like fnm/nvm
```

### A Nerd Font (for icons)

Install a [Nerd Font](https://www.nerdfonts.com/) and configure your terminal to use it.

## Installation

### 1. Back up existing config (if any)

```bash
# Back up current config
mv ~/.config/nvim ~/.config/nvim.bak

# Optional: back up state/cache too
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone this repository

```bash
git clone <THIS_REPO_URL> ~/.config/nvim
```

### 3. Launch Neovim

```bash
nvim
```

On first launch:
1. **lazy.nvim** bootstraps itself automatically (cloned from GitHub).
2. All plugins are installed and pinned to exact versions via `lazy-lock.json`.
3. **Mason** installs the configured LSP servers, formatters, and linters (gopls, pyright, ruff, etc.).

This may take a minute. Let it finish, then restart Neovim.

### 4. Verify

Run `:checkhealth` inside Neovim to confirm everything is working. Address any warnings about missing dependencies.

## Updating

- `:Lazy sync` -- update all plugins (respects lock file; use `:Lazy update` to pull latest)
- `:Mason` -- manage LSP servers, formatters, and linters

## Structure

```
~/.config/nvim/
  init.lua                 -- Entry point, loads config.lazy
  lazy-lock.json           -- Pinned plugin versions
  lazyvim.json             -- Enabled LazyVim extras
  lua/
    config/
      autocmds.lua         -- Custom autocommands
      keymaps.lua          -- Custom keymaps
      lazy.lua             -- lazy.nvim bootstrap and setup
      options.lua          -- Vim options (e.g. relativenumber=false)
    plugins/
      lspconfig.lua        -- LSP config (Go, Python)
      typescript-tools.lua -- TypeScript LSP
      transparent.lua      -- Transparent background plugin
      snacks-animated-scrolling-off.lua
      ush.lua              -- USH.nvim
      example.lua          -- LazyVim example (reference)
  plugin/after/
    transparency.lua       -- Force transparent highlights
```

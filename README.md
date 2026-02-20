# Neovim Configuration (LazyVim)

Personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## What's included

- **Languages**: Go (gopls with codelens), Python (pyright + ruff), TypeScript (typescript-tools.nvim), JSON, TOML, Markdown
- **Debugging**: nvim-dap with Delve (Go), debugpy (Python), js-debug (TypeScript)
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

## Debugger (DAP)

Debugging is provided by [nvim-dap](https://github.com/mfussenegger/nvim-dap) via the LazyVim `dap.core` extra. Language-specific adapters are bundled with their lang extras:

| Language   | Adapter  | Installed via           |
|------------|----------|-------------------------|
| Go         | Delve    | `lang.go` extra         |
| Python     | debugpy  | `lang.python` extra     |
| TypeScript | js-debug | `lang.typescript` extra |

Mason auto-installs the debug adapters on first launch.

### Keybindings

All debugger keys use the `<leader>d` prefix:

| Key           | Action               |
|---------------|----------------------|
| `<leader>db`  | Toggle breakpoint    |
| `<leader>dB`  | Conditional breakpoint |
| `<leader>dc`  | Continue / Run       |
| `<leader>da`  | Run with args        |
| `<leader>dC`  | Run to cursor        |
| `<leader>di`  | Step into            |
| `<leader>do`  | Step out             |
| `<leader>dO`  | Step over            |
| `<leader>dl`  | Run last             |
| `<leader>dt`  | Terminate            |
| `<leader>du`  | Toggle DAP UI        |
| `<leader>de`  | Eval expression      |
| `<leader>dr`  | Toggle REPL          |
| `<leader>dP`  | Pause                |
| `<leader>dj`  | Down (stack frame)   |
| `<leader>dk`  | Up (stack frame)     |
| `<leader>dw`  | Widgets (var hover)  |

Custom bindings:

| Key           | Action                          |
|---------------|---------------------------------|
| `<leader>dT`  | Debug nearest test (Go/Python) |
| `<leader>dL`  | Load `.vscode/launch.json`     |

Python adds two extra bindings:

| Key            | Action        |
|----------------|---------------|
| `<leader>dPt`  | Debug method  |
| `<leader>dPc`  | Debug class   |

### VS Code launch.json

Projects with a `.vscode/launch.json` are supported. Press `<leader>dL` to load the launch configs, then `<leader>dc` to pick and run one. Adapter type mappings:

- `pwa-node` / `node` → JavaScript, TypeScript
- `dlv` → Go
- `debugpy` → Python

### Quick start

1. Open a source file (`.go`, `.py`, `.ts`, etc.).
2. Set a breakpoint with `<leader>db`.
3. Start debugging with `<leader>dc`. For Go and TypeScript this launches the current file; for Python it uses `debugpy`.
4. The DAP UI opens automatically. Use step keys to navigate and `<leader>de` to evaluate expressions.
5. `<leader>dt` to terminate the session.

To use a VS Code launch config: `<leader>dL` to load, then `<leader>dc` to pick a configuration.

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
      dap-test.lua         -- Debug nearest test keybindings
      transparent.lua      -- Transparent background plugin
      snacks-animated-scrolling-off.lua
      ush.lua              -- USH.nvim
      example.lua          -- LazyVim example (reference)
  plugin/after/
    transparency.lua       -- Force transparent highlights
```

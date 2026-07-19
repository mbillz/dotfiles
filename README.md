# dotfiles

Personal config, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a stow package that mirrors its target path under `$HOME`:

- `ghostty/` — terminal config + catppuccin-frappe theme
- `herdr/` — theme config for the `herdr` terminal workspace manager
- `nvim/` — Neovim config (lazy.nvim, treesitter on the `main` branch API)
- `pi/` — settings for the `pi` coding agent CLI
- `tmux/` — tmux config

## Setup

```sh
git clone <repo> ~/dotfiles
cd ~/dotfiles
stow ghostty herdr nvim pi tmux
```

Each package symlinks into place (e.g. `~/.tmux.conf -> dotfiles/tmux/.tmux.conf`). Re-run `stow <package>` after adding new files to a package.

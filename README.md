# Dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

Install chezmoi, apply the dotfiles, then install the Homebrew bundle:

```sh
brew install chezmoi
chezmoi init --apply https://github.com/sujianqingfeng/dotfiles.git
brew bundle --global
```

The repository manages:

- zsh, Oh My Zsh, fnm, proxy, and tmux configuration
- Homebrew formulae, casks, and VS Code extensions
- Karabiner-Elements keyboard mappings
- Zed and VS Code settings/keybindings
- GitHub CLI and Otty preferences (without login state)
- macOS keyboard, Dock, and Finder preferences

Apply later changes with:

```sh
chezmoi update
brew bundle --global
```

## Secrets

This is a public repository. API keys, tokens, cookies, login files, and
machine-local environment files must not be committed. Before committing, run:

```sh
sh scripts/check-secrets.sh
```

Project-local `.codex.env` and `.env.codex` files are ignored globally by Git.
Store long-lived credentials in macOS Keychain or 1Password instead of shell
configuration.

## Other

### Proxy SwitchyOmega

```text
Gitlab: https://gitlab.com/gfwlist/gfwlist/raw/master/gfwlist.txt
```

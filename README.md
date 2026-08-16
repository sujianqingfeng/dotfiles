# Dotfiles

macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

Install chezmoi, apply the dotfiles, then install the Homebrew bundle:

```sh
brew install chezmoi
chezmoi init --apply https://github.com/sujianqingfeng/dotfiles.git
brew bundle --global
mise install
```

The repository manages:

- zsh, Oh My Zsh, mise, proxy, and tmux configuration
- Node.js, Python, Java, Rust, Bun, pnpm, and uv versions through mise
- Homebrew formulae, casks, and VS Code extensions
- Karabiner-Elements keyboard mappings
- Zed and VS Code settings/keybindings
- GitHub CLI and Otty preferences (without login state)
- macOS keyboard, Dock, and Finder preferences

Apply later changes with:

```sh
chezmoi update
brew bundle --global
mise install
```

## Development tools

Global development-tool defaults are declared in
`~/.config/mise/config.toml`. Project-level `mise.toml`, `.node-version`, and
`.python-version` files override these defaults when entering a project.
Pinned global CLI packages are declared in the same file so a new Mac does not
depend on packages left inside an old fnm or Bun installation.

Shell startup only calls `mise activate zsh`; runtime-specific PATH and
`JAVA_HOME` entries must not be added to `.zshrc` or `.zprofile`. The mise
shims directory is added in `.zprofile` so project tools cannot fall through
to a Homebrew runtime when the requested version is not installed yet.

Run `mise install` once inside an existing project to preinstall versions from
its `mise.toml`, `.node-version`, or `.python-version` file.

On a new Mac, run the setup commands above, restart the shell, then verify:

```sh
mise doctor
mise current
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

For machine-local shell settings, create `~/.zsh/local.zsh`. This file is
loaded when present and is intentionally not managed by chezmoi.

## Other

### Proxy SwitchyOmega

```text
Gitlab: https://gitlab.com/gfwlist/gfwlist/raw/master/gfwlist.txt
```

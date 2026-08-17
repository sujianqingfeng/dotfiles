# Codex project-scoped environment switching.
# Add one of these files at a repo root:
#   .codex.env
#   .env.codex
# The file can contain exports like:
#   export OPENAI_API_KEY="<set locally>"
#   export CODEX_PROJECT_PROFILE="wxb"
#   export CODEX_WXB_API_KEY="<set locally>"
# If OPENAI_API_KEY is set but CODEX_PROJECT_PROFILE is not, Codex uses the
# profile named by CODEX_PROJECT_DEFAULT_PROFILE, or "ai" by default.

autoload -Uz add-zsh-hook

typeset -gA _codex_project_env_saved
typeset -gA _codex_project_env_seen
typeset -ga _codex_project_env_vars=(
  OPENAI_API_KEY
  OPENAI_BASE_URL
  OPENAI_ORG_ID
  OPENAI_PROJECT_ID
  CODEX_PROJECT_PROFILE
  CODEX_WXB_API_KEY
)
typeset -g _codex_project_env_last_file=""

_codex_project_env_log() {
  emulate -L zsh
  print -u2 -- "[codex-env] $*"
}

for _codex_var in "${_codex_project_env_vars[@]}"; do
  if (( ${+parameters[$_codex_var]} )); then
    _codex_project_env_saved[$_codex_var]="${(P)_codex_var}"
    _codex_project_env_seen[$_codex_var]=1
  else
    _codex_project_env_seen[$_codex_var]=0
  fi
done

_codex_project_env_restore() {
  emulate -L zsh
  local _codex_var
  for _codex_var in "${_codex_project_env_vars[@]}"; do
    if (( ${_codex_project_env_seen[$_codex_var]:-0} )); then
      export "$_codex_var=${_codex_project_env_saved[$_codex_var]}"
    else
      unset "$_codex_var"
    fi
  done
}

_codex_project_env_find_file() {
  emulate -L zsh
  local _codex_dir="$PWD"
  local _codex_candidate

  while [[ -n "$_codex_dir" ]]; do
    for _codex_candidate in .codex.env .env.codex; do
      if [[ -f "$_codex_dir/$_codex_candidate" ]]; then
        print -r -- "$_codex_dir/$_codex_candidate"
        return 0
      fi
    done

    [[ "$_codex_dir" == "/" ]] && break
    _codex_dir="${_codex_dir:h}"
  done

  return 1
}

_codex_project_env_apply() {
  emulate -L zsh
  local _codex_file=""

  _codex_file="$(_codex_project_env_find_file)" || _codex_file=""
  if [[ "$_codex_file" == "$_codex_project_env_last_file" ]]; then
    return 0
  fi

  _codex_project_env_restore

  if [[ -n "$_codex_file" ]]; then
    source "$_codex_file"
    if [[ -n "${OPENAI_API_KEY:-}" && -z "${CODEX_PROJECT_PROFILE:-}" ]]; then
      export CODEX_PROJECT_PROFILE="${CODEX_PROJECT_DEFAULT_PROFILE:-ai}"
    fi
    _codex_project_env_last_file="$_codex_file"
    if [[ -n "${CODEX_PROJECT_PROFILE:-}" ]]; then
      _codex_project_env_log "loaded ${_codex_file} with profile ${CODEX_PROJECT_PROFILE}"
    else
      _codex_project_env_log "loaded ${_codex_file}"
    fi
  else
    _codex_project_env_last_file=""
    _codex_project_env_log "restored shell defaults"
  fi
}

# Wrapper: load the matching ~/.codex/<profile>.config.toml when a project
# profile is set. Explicit --profile/-p arguments always win.
_codex_has_profile_flag() {
  local _codex_arg
  for _codex_arg in "$@"; do
    case "$_codex_arg" in
      -p|--profile|--profile=*) return 0 ;;
    esac
  done
  return 1
}

codex() {
  local -a _codex_extra_args=()

  if [[ -n "${CODEX_PROJECT_PROFILE:-}" ]] &&
     ! _codex_has_profile_flag "$@"; then
    _codex_extra_args+=(--profile "$CODEX_PROJECT_PROFILE")
  fi

  command codex "${_codex_extra_args[@]}" "$@"
}

add-zsh-hook chpwd _codex_project_env_apply
_codex_project_env_apply

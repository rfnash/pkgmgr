if [[ ! -o interactive ]]; then
    return
fi

compctl -K _pkgmgr pkgmgr

_pkgmgr() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(pkgmgr commands)"
  else
    completions="$(pkgmgr completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

function cdd() {
	cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function gac() {
  git add . && git commit -m "$1" && git push
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		autoenv "$cwd"
	fi
	rm -f -- "$tmp"
}

function fix() {
  selected=( $(fc -rl 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  fc -e - "$selected[1]"
}


vc() {
  # Create a unique temporary file
  local tmpfile
  tmpfile=$(mktemp /tmp/vexec.XXXXXX)

  # Pre-populate the file with a shebang (change to your preferred interpreter if needed)
  dot scaffolds script --language temp_script --output "$tmpfile"

  # Open the temporary file in vim for editing
  nvim +2 "$tmpfile"

  # Make the script executable

  # Check if the file contains more than just the shebang
  if [ "$(wc -l < "$tmpfile")" -gt 1 ]; then
    # Execute the temporary script file
    "$tmpfile"
    print -s "$(cat "$tmpfile")"
  fi

  # Remove the temporary file
  rm "$tmpfile"

}

upfind() {
  # Usage: upfind <start_dir> <find options...>
  # Example: upfind /home/x/y -name ".env" -type f

  # Resolve the starting directory to an absolute path.
  local start_dir
  start_dir=$(readlink -f "$1")
  local dir="$start_dir"
  shift 1  # Now "$@" contains only the find options.
  local result

  while true; do
    # Search in the current directory, limiting to maxdepth 1, and take the first match.
    result=$(find "$dir" -maxdepth 1 "$@" | head -n 1)

    # If we find a match, exit the loop.
    if [[ -n $result ]]; then
      break
    fi

    # If we are at $HOME and no match is found, output an error and exit.
    if [[ "$dir" == "$HOME" ]]; then
      echo "No matching file found." >&2
      return 1
    fi

    # Move up one directory.
    dir=$(dirname "$dir")
  done

  # Output the found file's path relative to the starting directory.
  echo "$(realpath --relative-to="$start_dir" "$result")"
}

function autoenv() {
  if [[ -z "$1" ]]; then
    selected=$(zi && realpath "$(pwd)")
  elif [[ -d "$1" ]]; then
    selected=$(realpath "$1")
  fi 

  if [[ ! -d "$selected" ]]; then
    echo "Invalid directory"
    return 0
  fi

  # Create a session name from the basename, replacing punctuation and spaces with underscores
  selected_name=$(basename "$selected" | tr ".,: " "____")

  z $selected

  kitten @ set-window-title "$selected_name"

  layout=$(upfind "$selected" -name ".mkenv.kdl" -type f)

  # Check if a session with the name exists.
  if zellij list-sessions | grep -q "$selected_name"; then
    zellij attach -f "$selected_name"
  else
    # Create a new session in detached mode with the working directory set to "$selected"
    zellij --session "$selected_name" --new-session-with-layout $layout
  fi
}

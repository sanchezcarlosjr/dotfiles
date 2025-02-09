#!/usr/bin/env bash 

# Set up options
set -euo pipefail

# Load _main.sh if it exists in the given path
[ -f "$DOTLY_PATH/scripts/core/_main.sh" ] && source "$DOTLY_PATH/scripts/core/_main.sh"

##? Stops and removes a running Docker container gracefully
#?? 1.0.0
##?
##? Usage:
##?   rm [container_name]

if which docker >/dev/null; then # Check if Docker is installed and in PATH

  containers=$(docker ps --quit-on-error --format='{{.Names}}') || exit 1

  if [[ -n "$1" ]]; then
    container_name="$1"

    if [[ "${containers[@]}" =~ "^${container_name}$" ]]; then
      container_id=$(docker ps --filter name="${container_name}" --quit-q -l) || exit 1

      echo "Stopping and removing container '${container_name}' (${container_id})..." >&2
      docker stop "${container_id}" || { echo >&2; echo "Failed to stop container '${container_name}': ${container_id}"; exit 1; }
      docker rm "${container_id}" || { echo >&2; echo "Failed to remove container '${container_name}': ${container_id}"; exit 1; }
    else
      echo "Container '${container_name}' not found!" >&2
      exit 1
    fi

  elif [[ ${#containers[@]} -gt 0 ]]; then
    container=$(echo "${containers[@]}" | fzf) || exit 1
    container_id=$(docker ps --filter name="^${container}$" --quit-q -l) || exit 1

    echo "Stopping and removing container '${container}' (${container_id})..." >&2
    docker stop "${container_id}" || { echo >&2; echo "Failed to stop container '${container}': ${container_id}"; exit 1; }
    docker rm "${container_id}" || { echo >&2; echo "Failed to remove container '${container}': ${container_id}"; exit 1; }

  else
    echo "No running containers found!" >&2
    exit 1
  fi

else
  echo "Docker is not installed or not in your PATH!" >&2
  exit 1
fi

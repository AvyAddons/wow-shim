#!/usr/bin/env bash
# Clones the annotation corpora to the paths every addon's .luarc.json expects,
# and links this repo in as the shim. Safe to re-run: existing clones are kept.
set -euo pipefail

share="$HOME/.local/share"
shim="${SHIM_PATH:-$(cd "$(dirname "$0")" && pwd)}"
mkdir -p "$share"

# Sparse clone of one branch, limited to the given top-level directories.
clone() {
	local url=$1 branch=$2 dir=$3
	shift 3
	[ -e "$dir" ] && return
	git clone -q --depth 1 --filter=blob:none --sparse --branch "$branch" "$url" "$dir"
	git -C "$dir" sparse-checkout set "$@"
}

# FramexmlAnnotations keeps its generator on master and the annotations on
# per-flavor branches. The plain `live` branch omits a third of the AddOns
# (Blizzard_Settings among them); the mix-into-source variant is complete.
clone https://github.com/Ketho/vscode-wow-api master "$share/wow-api" Annotations/Core
clone https://github.com/NumyAddon/FramexmlAnnotations live-mix-into-source "$share/wow-framexml" Annotations
clone https://github.com/Ketho/BlizzardInterfaceResources live "$share/wow-interface-resources" Resources/GlobalStrings
[ -e "$share/wow-shim" ] || ln -s "$shim" "$share/wow-shim"

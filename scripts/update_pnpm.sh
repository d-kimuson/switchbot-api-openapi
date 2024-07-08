#!/bin/bash

set -eux

PREV_PNPM_VERSION=$(pnpm -v)
version_json="$(curl -fsSL "https://registry.npmjs.org/@pnpm/exe")" || abort "Download Error!"
CURRENT_PNPM_VERSION="$(printf '%s' "${version_json}" | tr '{' '\n' | awk -F '"' '/latest/ { print $4 }')"
corepack prepare pnpm@$CURRENT_PNPM_VERSION --activate

depends="package.json ./scripts/setup.sh"

for depend in $depends; do
  sed -i -e "s/$PREV_PNPM_VERSION/$CURRENT_PNPM_VERSION/g" $depend
done

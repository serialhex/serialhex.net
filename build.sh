#!/bin/sh
# Rebuild the site generator and refresh the tracked ./site binary.
# Only needed after editing site.hs.
set -e
cabal build
cp -f "$(cabal list-bin site)" site

#!/usr/bin/env bash
set -euo pipefail

# Query:
# el repo ORWeb es una mica pobre. No te agina principal, per exemple.
# Caldria que aquesta pagina resumeixi tambe tot el material. Ho pots revisar?

WORKDIR="/Users/jordivilla/GitHub/WEB/ORweb"
COURSE_DIR="/Users/jordivilla/GitHub/TEACHING/ORcourse"

cd "$WORKDIR"

find . -maxdepth 3 -path './.codex*' -print
rg --files
git status --short
sed -n '1,220p' README.md
sed -n '1,260p' docs/index.md
sed -n '1,260p' docs/about.md
sed -n '1,260p' docs/projects/OptimizationProject.md
sed -n '1,260p' docs/_layouts/default.html
sed -n '1,220p' _config.yml
sed -n '1,220p' "$COURSE_DIR/Syllabus.md"
sed -n '1,180p' "$COURSE_DIR/README.md"

jekyll build --trace
curl -I http://127.0.0.1:4000/ || true
curl -I http://127.0.0.1:4000/css/style.css || true
curl -I http://127.0.0.1:4000/projects/OptimizationProject.html || true

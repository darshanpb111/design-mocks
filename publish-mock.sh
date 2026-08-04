#!/usr/bin/env bash
# publish-mock.sh <slug> <source.html> "<Title>" ["<Module>"] ["<Summary>"]
# Copies a mock in, registers it in mocks.json, commits and pushes.
set -euo pipefail
slug="${1:?slug required}"; src="${2:?source html required}"; title="${3:?title required}"
module="${4:-Sitetracker}"; summary="${5:-}"
root="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$root/mocks/$slug"
cp "$src" "$root/mocks/$slug/index.html"
python3 - "$root" "$slug" "$title" "$module" "$summary" << 'PY'
import json,sys,datetime,pathlib
root,slug,title,module,summary = sys.argv[1:6]
f = pathlib.Path(root,'mocks.json'); items = json.loads(f.read_text())
items = [i for i in items if i['slug'] != slug]
items.insert(0, {'slug':slug,'title':title,'module':module,'status':'In review',
  'updated':datetime.date.today().isoformat(),
  'summary':summary or 'Static prototype for review.','notes':[]})
f.write_text(json.dumps(items, indent=2) + '\n')
PY
cd "$root"
git add -A && git commit -q -m "mock: $slug — $title" && git push -q origin main
echo "https://darshanpb111.github.io/design-mocks/mocks/$slug/"

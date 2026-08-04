# Design Mocks

Static, self-contained UI prototypes for design and dev review. Every mock is a single HTML file
with no dependencies, no build step and no org — open it in a browser and click around.

**Live gallery:** https://darshanpb111.github.io/design-mocks/

> **Internal review material.** These are unreleased product designs. The site is `noindex` and
> unlisted, but GitHub Pages serves it publicly — anyone with a link can open it. Share links inside
> the team only. Never put real customer data in a mock.

## Layout

```
index.html                     gallery, rendered from mocks.json
mocks.json                     one entry per mock
mocks/<slug>/index.html        the mock itself — its own stable URL
robots.txt                     Disallow: / (keeps it out of search results)
.nojekyll                      serve files as-is
```

## Adding a mock

1. `mkdir -p mocks/<slug>` and put the HTML at `mocks/<slug>/index.html`
   (include `<meta name="robots" content="noindex,nofollow">` in the head).
2. Add an entry to `mocks.json` — `slug`, `title`, `module`, `status`, `updated`, `summary`,
   and optional `notes[]` for reviewer hints.
3. Commit and push. Pages redeploys in ~1 minute.

Or run `./publish-mock.sh <slug> <path-to-html> "<Title>"` which does all three.

## Current mocks

| Slug | Feature | URL |
|---|---|---|
| `style-templates` | Style Templates on Lightning Maps (Beta) | [/mocks/style-templates/](https://darshanpb111.github.io/design-mocks/mocks/style-templates/) |

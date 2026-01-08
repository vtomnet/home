NEVER commit .env* files or node_modules.

To add dependencies to a JS/TS project, ALWAYS use `bun add` (or `npm install`). Do not write in the dependencies yourself.

Use `bun` instead of `npm`.
Use `uv` for Python projects.

NO fallback code paths. NO backwards compatibility. Always prefer simple "one path" code.

---

For converting files, you have access to `soffice`, `pandoc`, `ffmpeg`, and `magick`.
You may `brew install` additional tools as needed.

---
agent: agent
description: "Identify and output minimum supported browser versions for the current project."
---

Identify and output the minimum supported browser versions for the current workspace.

Execution policy:
- Determine targets from project configuration in this order:
  1. Explicit Browserslist config (`.browserslistrc`, `browserslist` in `package.json`, or `browserslist` config files).
  2. Tool-specific browser target config (Babel, PostCSS/Autoprefixer, framework config).
  3. Framework defaults only if no explicit project config exists.
- Prefer resolving with CLI output when available (`npx --yes browserslist`).
- If CLI is unavailable, derive targets directly from config files.
- Normalize the resolved targets into one minimum version per browser family.

Report:
- A table with `Browser` and `Minimum supported version`.
- The source of truth used (exact file path(s) or framework fallback).
- The exact command(s) executed.
- Confidence and limitations (for example, inferred defaults or missing config).

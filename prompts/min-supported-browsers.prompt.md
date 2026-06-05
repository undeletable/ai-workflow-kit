---
agent: agent
description: "Identify and output minimum supported browser versions for the current project."
---

Identify and output the minimum supported browser versions for the current workspace.

Execution policy:
- Determine targets from project configuration in this order:
  1. Explicit project browser-target config.
  2. Tool-specific browser target config (Babel, PostCSS/Autoprefixer, framework config).
- Ignore browser-version claims found only in Copilot-specific artifacts such as instructions, prompts, skills, agent metadata, or other AI workflow docs. Treat them as non-authoritative unless the same target is enforced by project code or build configuration.
- If no browser-target config exists, inspect the codebase for browser-dependent features and infer the minimum browser versions required.
- Validate inferred support against compatibility sources such as MDN, Can I Use, and official platform documentation.
- Framework defaults only if no explicit project config exists and no code-feature-based inference is possible.
- Prefer resolving with CLI output when available.
- If CLI is unavailable, derive targets directly from config files.
- Normalize the resolved targets into one minimum version per browser family.

Report:
- A table with `Browser` and `Minimum supported version`.
- The source of truth used (exact file path(s) or framework fallback).
- The exact command(s) executed.
- Confidence and limitations (for example, inferred defaults or missing config).

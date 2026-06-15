---
applyTo: "**"
description: "Global Copilot defaults: code-only by default, browser verification only when requested."
---

Use these defaults unless the user explicitly requests otherwise.

- Default workflow is code-only: implement changes, run relevant static checks/tests, and report results.
- Do not open a browser page or perform UI verification by default.
- Switch to browser verification workflow only when the user asks for UI/browser/visual/click-flow/e2e verification, or when using the dedicated browser prompt.
- In browser verification workflow: run the app, validate the changed behavior in browser, and report exactly what was verified and any gaps.
- For complex or multi-step changes: first plan the changes, ask for user approval, and proceed with implementation only after approval.

---
name: ui
description: Short command for browser mode. Use when UI/browser verification is required.
disable-model-invocation: true
---
Run browser mode for this request:
${input:task}

Execution policy:
- Implement requested changes.
- Verify result in browser.
- Summarize what was validated and what was not.

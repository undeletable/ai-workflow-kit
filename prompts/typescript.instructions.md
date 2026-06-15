---
applyTo: "**/*.{ts,tsx}"
description: "TypeScript code generation defaults and best practices"
---

TypeScript code generation defaults:

- Always consider the TypeScript version in `package.json` and compiler options from the project's TypeScript config files before generating or editing TS code.
- Do not use double assertions (`as unknown as`) under any circumstances.
- Avoid single assertions (`as`) unless there is no practical alternative to satisfy type checking without introducing errors.
- Prefer `type` aliases over `interface` for object data structures unless an `interface` is explicitly required.

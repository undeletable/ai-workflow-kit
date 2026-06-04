# Cross-Platform Line Ending Configuration

This repository is configured for automatic line ending handling across Linux and Windows machines.

## How It Works

- **Repository**: All text files are stored with Unix-style line endings (LF)
- **Linux checkout**: Files are checked out with LF line endings
- **Windows checkout**: Files are checked out with Windows-style line endings (CRLF)
- **Commits**: Each platform commits with normalized LF line endings

This is handled automatically by `.gitattributes` using the `text=auto` directive.

## Machine Setup

### Linux

```bash
# Set git to preserve LF on checkout (recommended for Linux)
git config --global core.autocrlf input
```

### Windows

```bash
# Set git to convert to CRLF on checkout
git config --global core.autocrlf true
```

## Repository Configuration

- `.gitattributes` defines line ending behavior for all files
- `core.safecrlf = warn` alerts you to unsafe line ending conversions
- Binary files are explicitly marked to prevent conversion
- Shell scripts (`.sh`) always use LF regardless of platform

## What This Means

After pulling changes:
- **On Linux**: Files will have LF line endings (native to Linux)
- **On Windows**: Files will have CRLF line endings (native to Windows)

When you commit:
- Git automatically normalizes to LF before storing in the repository
- Other team members pull files with their platform's native line endings

## Git Hooks

All git hooks (`.githooks/*`) must use LF line endings for cross-platform compatibility. This is enforced by `.gitattributes`.

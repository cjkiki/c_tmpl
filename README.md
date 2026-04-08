# c_tmpl

A professional, modern, and minimal C project template designed for development.
This template provides a robust directory structure, Makefile, and integrated tooling.

## Features

- Clean directory structure
- Debug and release support
- clang-format and editorconfig support

## Project structure

```text
.
├── build/                # All generated files (gitignored)
│   ├── bin/              # Executables (debug/release)
│   └── obj/              # Object files and dependencies
├── include/              # Public API Headers
│   └── tmpl/             # Project namespace to prevent collisions
├── src/                  # Source files and internal headers
├── Makefile              # The build system
├── .clang-format         # Code style configuration
└── .editorconfig         # Editor consistency
```

## Requirements

- C compiler
- Make
- Clang-tools

## Getting started

1. Clone the template

```bash
git clone https://github.com/cjkiki/c_tmpl.git my_project
cd my_project
```

2. Build the project

By default, the project builds both modes, debug & release.

```bash
make
make debug      # Only debug mode
make release    # Only release mode

# Other make commands
make format     # Format the code
make clean      # Clean the build artifacts
```

3. At last run the executable

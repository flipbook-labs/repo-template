# Contributing

## Set up

Install the toolchain pinned in `rokit.toml` with [Rokit](https://github.com/rojo-rbx/rokit), then Lute's type definitions and the dependencies:

```sh
rokit install
lute setup
lute run install
```

`lute run install` vendors each dependency into a gitignored `.lpm/` folder. The shared agent skills land there too.

## Check your changes

```sh
lute run check
```

This runs the same checks as CI:

- `changewrite check --fix` validates the changelog entries and rewrites any written for an older version of Changewrite.
- `lute run lint` runs [CodeQuality](https://github.com/flipbook-labs/code-quality)'s shared lint rules and StyLua, and fails on any file that uses `.lua` instead of `.luau`.
- `lute run analyze` type-checks the code with luau-lsp. `.config.luau` sets strict mode for every file.
- `lute test` runs the `*.spec.luau` files next to the code they cover.

## Add a changelog entry

Each pull request adds one Luau file to `.changes/`. [`.changes/README.md`](.changes/README.md) lists its fields. At release time, Changewrite combines the entries into `CHANGELOG.md`.

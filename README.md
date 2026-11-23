# RepoTemplate

The starting point for new flipbook-labs repositories. It holds what every repository shares: the Rokit toolchain, a Lute package manifest, `.lute/` scripts to install, lint, analyze, and check, CI and release workflows that follow the org's conventions, shared lint rules from CodeQuality, a StyLua config, a pull request template, an agent guide, and the MIT license.

The source is a small Luau package with one function and one test, so CI has real code to check from the first commit. Replace it with your own.

## Use

Create the repository from this template with **Use this template** on GitHub, or with the GitHub CLI:

```sh
gh repo create flipbook-labs/<name> --template flipbook-labs/repo-template --public --clone
```

Then work through the checklist below. Each step is one the template can't take for you.

## Checklist

For every repository:

- [ ] Set `name` in `pkg.luau` to the PascalCase name prose uses, such as `FlipbookBatteries`, and replace `src/` with your code.
- [ ] Replace this README with the App, Package, or Tool template from the `org/write-readme` skill. `lute run install` vendors the skills into `.lpm/agent-skills@<rev>`.
- [ ] Replace the comment at the top of `AGENTS.md` with a paragraph on what the repository is.
- [ ] Register the repository in [infra](https://github.com/flipbook-labs/infra)'s GitHub stack with one pull request. Add a `main` ruleset to `stacks/github/rulesets.tf` that requires the `analyze`, `changelog`, `lint`, and `test` checks. Add the repository to `flipbook_backend_app_consumers` in `stacks/github/actions.tf`, so the Release workflow can read `FLIPBOOK_BACKEND_CLIENT_ID`. If `flipbook-admins` and `flipbook-engine` should have access, add it to `engine_repositories` in `stacks/github/access.tf` and to the list in the stack's README.
- [ ] Grant the `FLIPBOOK_BACKEND_APP_PRIVATE_KEY` organization secret to the repository. The secret lives outside the infra stack, so this step is manual.
- [ ] Add a `.changes/` entry to the first pull request. The version starts at `0.0.0`, so a `minor` entry makes the first release `0.1.0`.

For apps and CLIs:

- [ ] Commit `pkg.lock.luau` so builds are reproducible: delete its line from `.gitignore`.
- [ ] Add a `.lute/build.luau` script and a `build` CI job, and attach the build to each release with Changewrite's `post-draft-hook`. [Changewrite](https://github.com/flipbook-labs/changewrite)'s own workflows do this.

For Roblox packages:

- [ ] Add Rojo and Wally to `rokit.toml`, a `wally.toml` that `changewrite.luau` mirrors the version into, and a Wally publish step to the Release workflow. [Storyteller](https://github.com/flipbook-labs/storyteller) has a working setup.

## Keep the template current

The template follows the org's conventions in the `org/repo-conventions` skill. When an org-wide pass bumps toolchain pins or changes a convention in the other repositories, update the template in the same pass. Its CI runs the same `analyze`, `lint`, and `test` checks a new repository gets, so a broken scaffold fails here first.

The template never releases, so its pull requests skip the changelog check and add no `.changes/` entries. `lute run check` stops at that step here, so run `lute run lint`, `lute run analyze`, and `lute test` instead.

## License

MIT.

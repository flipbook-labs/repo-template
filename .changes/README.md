# Change entries

This folder holds the unreleased changes for the next release. Each file describes one change: how big a version bump it warrants and what to say about it in the changelog. At release time [Changewrite](https://github.com/flipbook-labs/changewrite) combines every entry here into `CHANGELOG.md`, bumps the version, and deletes the entries it consumed.

## Adding an entry

Create a Luau file in this folder that returns the entry's fields. Name the file after the change, such as `fix-release-permissions.luau`. The name only makes entries easier to browse.

```luau
return {
	bump = "minor",
	category = "Features",
	summary = "Add a `greet` function that returns a greeting for a name.",
}
```

- **`bump`** (required): how far to move the version, `"major"`, `"minor"`, or `"patch"`.
- **`category`** (required): the changelog heading the entry appears under. The headings are `Features`, `Changes`, `Fixes`, `Dependencies`, and `Internal`, in the order `categories` sets in [`changewrite.luau`](../changewrite.luau). Dependencies and Internal start collapsed in GitHub release notes.
- **`summary`** (required): the changelog line, written for someone reading the changelog without the pull request. Keep it to one sentence of at most 140 characters. `changewrite check` enforces both.
- **`body`** (optional): more detail in Markdown, shown collapsed under the summary.

## How the version is chosen

The next version takes the largest bump among the pending entries. One `major` entry makes the release a major. Otherwise one `minor` entry makes it a minor, and otherwise it's a patch. You don't pick the version directly. Describe the impact of each change instead.

# Agent guide

<!-- Replace this comment with one paragraph: what this repository is and what it ships. -->

This file is the entry point for any agent working in the repository. It routes you to the shared skills library and the repository's own setup.

## Mandatory first steps

Complete these steps before you write any code, tests, changelog entries, or PR prose.

1. Install the toolchain and dependencies:

   ```sh
   rokit install && lute setup && lute run install
   ```

   `lute run install` copies each dependency into a `.lpm/<key>@<rev>` folder, and code requires them through the `lpm` alias in `.config.luau`. The shared skills library, [AgentSkills](https://github.com/flipbook-labs/agent-skills), is a dev dependency, so it lands there too.

2. Find the skills folder. It's `.lpm/agent-skills@<rev>`, with the `rev` pinned in [`pkg.luau`](pkg.luau). Use that path wherever `<skills>` appears below.

3. Read the routing index at `<skills>/AGENTS.md` in full. It lists every skill with the tasks that call for it. When your task matches one, read that skill's `SKILL.md` before doing the work.

Before you call a task done, follow the `org/review-pass` skill. It maps the diff to the skills that govern each file and has you check the change against them.

## Forward this file to subagents

A subagent starts without this guide. When you delegate to one, include the steps above and the paths to the `SKILL.md` files its task needs.

## Keep skills current

When your work contradicts a skill, such as a renamed symbol or a bug it still calls known, fix the skill in the agent-skills repository with a `.changes/` entry. The fix reaches this repository on its next `rev` bump.

## Repository specifics

- `lute run check` runs the same checks as CI. [CONTRIBUTING.md](CONTRIBUTING.md) lists them.
- Tests are `*.spec.luau` files next to the code they cover.
- Each pull request adds one `.changes/` entry. [`.changes/README.md`](.changes/README.md) lists the fields.

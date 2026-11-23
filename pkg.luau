return {
	package = {
		name = "RepoTemplate",
		version = "0.0.0",
		files = {
			"/init.luau",
			"/src/**",
			"/README.md",
			"/LICENSE",
		},
		dependencies = {},
		dev_dependencies = {
			["agent-skills"] = {
				rev = "v0.8.0",
				sourceKind = "github",
				source = "https://github.com/flipbook-labs/agent-skills",
			},
			["code-quality"] = {
				rev = "v0.8.0",
				sourceKind = "github",
				source = "https://github.com/flipbook-labs/code-quality",
			},
		},
	},
}

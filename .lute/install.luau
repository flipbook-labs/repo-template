local run = require("./lib/run")

--[[
	Installs the dependencies in `pkg.luau`. `--vendor` copies each one into a
	`.lpm/<key>@<rev>` folder, and the `lpm` alias in `.config.luau` points at
	`.lpm`. A vendored package's own `@lpm` requires resolve through the `lpm`
	alias of the project that vendored it, not an alias of its own. So this
	repository's `.config.luau` has to keep that alias.
	The following issue tracks removing that requirement:
	https://github.com/flipbook-labs/flipbook/issues/694
]]
run({
	"lute",
	"pkg",
	"install",
	"--vendor",
})

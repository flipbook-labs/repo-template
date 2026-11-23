local run = require("./lib/run")

run({
	"luau-lsp",
	"analyze",
	"--settings=./.vscode/settings.json",
	"init.luau",
	"src",
	".lute",
})

local CodeQuality = require("@lpm/code-quality@v0.8.0")
local process = require("@std/process")

local run = require("./lib/run")

local PATHS = { "init.luau", "src", ".lute" }

CodeQuality.lint(PATHS)
run({ "stylua", "--check", table.unpack(PATHS) })

-- Luau files use the `.luau` extension. Asking git covers every tracked and
-- untracked file while skipping what `.gitignore` excludes, like `.lpm/`.
local result = process.run({
	"git",
	"ls-files",
	"--cached",
	"--others",
	"--exclude-standard",
	"*.lua",
})
if not result.ok then
	print(`[err] git ls-files failed: {result.stderr}`)
	process.exit(1)
end

if result.stdout ~= "" then
	print("[err] rename these files from '.lua' to '.luau':")
	print(result.stdout)
	process.exit(1)
end

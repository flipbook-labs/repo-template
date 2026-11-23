local process = require("@std/process")

-- Runs a command with its output streamed to the terminal, and exits the
-- script when the command fails so later steps don't run on a broken state.
local function run(command: { string })
	local result = process.run(command, { stdio = "inherit" })
	if not result.ok then
		print(`[err] {table.concat(command, " ")} failed`)
		process.exit(1)
	end
end

return run

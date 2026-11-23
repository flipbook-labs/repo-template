local run = require("./lib/run")

-- Runs the same checks as CI in one command, so a lint or type error turns up
-- before a pull request does. `--fix` also rewrites any changelog entries
-- written for an older version of Changewrite.
run({ "changewrite", "check", "--fix" })
run({ "lute", "run", "lint" })
run({ "lute", "run", "analyze" })
run({ "lute", "test" })

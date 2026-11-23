local test = require("@std/test")

local greet = require("./greet")

test.suite("greet", function(suite)
	suite:case("greets the given name", function(assert)
		assert.eq(greet("Flipbook"), "Hello, Flipbook!")
	end)
end)

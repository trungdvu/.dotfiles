require("trungdvu.set")
require("trungdvu.highlights")
require("trungdvu.plugins")

local has = function(x)
	return vim.fn.has(x) == 1
end
local is_macos = has "macunix"
local is_windows = has "win32"

if is_macos then
	require("trungdvu.macos")
end
if is_windows then
	require("trungdvu.windows")
end

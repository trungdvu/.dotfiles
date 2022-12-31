require("trungdvu.set")
require("trungdvu.remap")
require("trungdvu.highlights")
require("trungdvu.packer")

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require("trungdvu.macos")
end

if is_win then
  require("trungdvu.windows")
end

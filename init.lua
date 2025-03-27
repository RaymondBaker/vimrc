local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Declaring globals no longer allowed without being explicit
-- https://www.lua.org/pil/14.2.html
-- This breaks plugins sadly
--setmetatable(_G, {
--  __newindex = function (_, n)
--    error("attempt to write to undeclared variable "..n, 2)
--  end,
--  __index = function (_, n)
--    error("attempt to read undeclared variable "..n, 2)
--  end,
--})

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

for _, v in pairs(vim.api.nvim_get_runtime_file("lua/config/*", true)) do
  local module = v:gsub(".*lua/config/", "config/")
  module = module:gsub("%.lua$", "")
  module = module:gsub("/", ".")
  --print("Loading module", module)
  require(module)
end

require("lazy").setup("package")

vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("utilities")
--local tokyonightScheme = require("plugin.tokyonight1")
--print(tokyonightScheme) -- returns a hex mem address

local lazyConfig = require("plugin.lazyConfig")
require("lazy").setup("lazyPlugins",lazyConfig)

--require("plugin") 

require("utilities.autocommands")

require("utilities.pluginMappings")

--vim.cmd([[packadd matchit]])

local m = require("plugin.test")
m.printing()
---testing
vim.cmd([[colorscheme tokyonight]])
function testing()
    print("config loaded")
end

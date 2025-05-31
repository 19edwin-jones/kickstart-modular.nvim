return {
	"L3MON4D3/LuaSnip",
	event = "VeryLazy",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    snippets = { preset = 'luasnip' },
  }
}
-- vim: ts=2 sts=2 sw=2 et



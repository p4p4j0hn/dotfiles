return {
	{
		"miikanissi/modus-themes.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("modus-themes").setup({
				transparent = true,
			})
			-- defaults to auto.
			vim.cmd([[colorscheme modus]]) -- modus_operandi(light), modus_vivendi(dark)
		end,
	},
}

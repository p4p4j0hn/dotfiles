return {
	{
		"echasnovski/mini.snippets",
		opts = function()
			local mini_snippets = require("mini.snippets")
			return {
				snippets = {
					-- Load custom file with global snippets first (adjust for Windows)
					mini_snippets.gen_loader.from_file("~/.config/nvim/snippets/global.json"),

					-- Load snippets based on current language by reading files from
					-- "snippets/" subdirectories from 'runtimepath' directories.
					mini_snippets.gen_loader.from_lang(),
				},
			}
		end,
	},
}

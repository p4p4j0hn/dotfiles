return {
	"folke/snacks.nvim",
	opts = {
		explorer = {},
		picker = {
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
					layout = {
						preset = "sidebar",
						preview = false,
						layout = {
							position = "right",
						},
					},
				},
				files = {
					hidden = true,
					ignored = true,
				},
				grep = {
					hidden = true,
					ignored = true,
				},
			},
		},

		layout = {
			sidebar = {
				position = "right",
			},
		},
	},
}

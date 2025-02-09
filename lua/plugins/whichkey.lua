return {
	'folke/which-key.nvim',
	config = function ()
		local whichkey = require("which-key")

		whichkey.setup()

		whichkey.add {
			{ "<leader>c",  group = "[C]ode" },
			{ "<leader>c_", hidden = true },
			{ "<leader>d",  group = "[D]ocument" },
			{ "<leader>d_", hidden = true },
			{ "<leader>g",  group = "[G]it" },
			{ "<leader>g_", hidden = true },
			{ "<leader>h",  group = "More git" },
			{ "<leader>h_", hidden = true },
			{ "<leader>r",  group = "[R]ename" },
			{ "<leader>r_", hidden = true },
			{ "<leader>f",  group = "[F]ind by search" },
			{ "<leader>f_", hidden = true },
			{ "<leader>w",  group = "[W]orkspace" },
			{ "<leader>w_", hidden = true },
			{ "<leader>b",  group = "[B]uild" },
			{ "<leader>b_", hidden = true },
		}
	end
}

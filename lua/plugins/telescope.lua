return {
	'nvim-telescope/telescope.nvim',
	-- branch = '0.1.x',
	dependencies = {
		'folke/which-key.nvim',
		'nvim-lua/plenary.nvim',
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-h>"] = "which_key"
				},
			},
			preview = {
				filesize_limit = 0.5555,
			},
			path_display = { "truncate" },
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, 'fzf')

		vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
			{ desc = '[?] Find recently opened files' })
		vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers,
			{ desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>/', function()
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[/] Fuzzily search in current buffer' })

		vim.keymap.set('n', '<leader>ff', require('telescope.builtin').git_files, { desc = 'Search Git [F]iles' })
		vim.keymap.set('n', '<leader>fF', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
		vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
		vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Search current [W]ord' })
		vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
		vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Search [D]iagnostics' })
		vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = 'Search [R]esume' })
		vim.keymap.set('n', '<leader>ft', require('telescope.builtin').treesitter, { desc = 'Search [T]ree-sitter' })
	end
}

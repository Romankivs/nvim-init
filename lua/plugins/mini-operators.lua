return {
	'echasnovski/mini.operators',
	version = '*',
	opts = {
		-- avoid conflict with LSP references
		replace = {
			prefix = 'gs',
		},
		sort = {
			prefix = 'gS',
		},
	},
}

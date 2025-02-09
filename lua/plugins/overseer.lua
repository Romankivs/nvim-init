return {
	'stevearc/overseer.nvim',
	config = function()
		require("overseer").setup()
		vim.keymap.set('n', '<leader>bb', ':OverseerRun Build<cr>', { desc = '[B]uild main [B]uild task' })
		vim.keymap.set('n', '<leader>br', ':OverseerRun<cr>', { desc = '[B]uild [R]un task' })
		vim.keymap.set('n', '<leader>bt', ':OverseerToggle!<cr>', { desc = '[B]uild [T]oggle task list' })
		vim.keymap.set('n', '<leader>bd', ':DapNew<cr>', { desc = '[Build] [D]ebug' })
	end
}

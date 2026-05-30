local fzf = require('fzf-lua')

fzf.setup({
  'fzf-native',
  -- use mini.icons instead of nvim-web-devicons
  icon_provider = 'mini',
  defaults = {
    file_icons = true,
    git_icons  = true,
  },
  previewers = {
    builtin = {
      -- skip preview for files larger than ~500KB
      limit_b = 1024 * 500,
    },
  },
  files = {
    path_shorten = true,
  },
  grep = {
    rg_opts = '--max-filesize=1M --column --line-number --no-heading --color=always --smart-case',
  },
})

-- register as vim.ui.select provider
fzf.register_ui_select()

local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

map('<leader>?',       fzf.oldfiles,             '[?] Find recently opened files')
map('<leader><space>', fzf.buffers,              '[ ] Find existing buffers')
map('<leader>/',       fzf.blines,               '[/] Fuzzily search in current buffer')
map('<leader>ff',      fzf.git_files,            'Search Git [F]iles')
map('<leader>fF',      fzf.files,                'Search [F]iles')
map('<leader>fh',      fzf.help_tags,            'Search [H]elp')
map('<leader>fg',      fzf.live_grep,            'Search by [G]rep')
map('<leader>fw',      fzf.grep_cword,           '[S]earch current [W]ord')
map('<leader>fd',      fzf.diagnostics_document, 'Search [D]iagnostics')
map('<leader>fr',      fzf.resume,               'Search [R]esume')
map('<leader>ft',      fzf.treesitter,           'Search [T]ree-sitter')

require('mini.operators').setup({
  -- avoid conflict with LSP references
  replace = { prefix = 'gs' },
  sort    = { prefix = 'gS' },
})

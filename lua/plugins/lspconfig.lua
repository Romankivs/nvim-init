-- Remove 0.12 default LSP mappings — we define our own below
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gra')
vim.keymap.del('v', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'grx')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local nmap = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
    end
    local fzf = require('fzf-lua')

    -- Prefer fzf-lua pickers for navigation (shows results in a list)
    nmap('gr',        fzf.lsp_references,          '[G]oto [R]eferences')
    nmap('gd',        fzf.lsp_definitions,         '[G]oto [D]efinition')
    nmap('gI',        fzf.lsp_implementations,     '[G]oto [I]mplementation')
    nmap('<leader>D', fzf.lsp_typedefs,            'Type [D]efinition')
    nmap('<leader>s', fzf.lsp_document_symbols,    '[D]ocument [S]ymbols')
    nmap('<leader>S', fzf.lsp_workspace_symbols,   '[W]orkspace [S]ymbols')

    -- Leader aliases (muscle memory)
    nmap('<leader>rn', vim.lsp.buf.rename,      '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    vim.api.nvim_buf_create_user_command(args.buf, 'Format', function()
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end,
})

vim.lsp.config('clangd', {
  cmd = { 'clangd', '--header-insertion=never' },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
})

vim.lsp.enable({ 'clangd', 'lua_ls', 'rust_analyzer', 'pyright' })

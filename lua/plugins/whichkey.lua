local wk = require('which-key')

wk.setup()

wk.add({
  { '<leader>f', group = '[F]ind' },
  { '<leader>r', group = '[R]ename' },
})


return {
  {
    'nat-418/boole.nvim',
    event = 'VeryLazy', -- or 'InsertEnter', 'BufReadPre', etc. depending on when you want it loaded
    config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>',
        },
        additions = {
          { 'Foo', 'Bar' },
          { 'tic', 'tac', 'toe' },
        },
        allow_caps_additions = {
          { 'enable', 'disable' },
          { 'true', 'false' },
          { 'TODO', 'DONE' },
        },
      })
    end,
  },
}


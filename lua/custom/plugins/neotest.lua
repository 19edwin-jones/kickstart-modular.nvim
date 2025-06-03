return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "alfaix/neotest-gtest",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-gtest").setup({})
      }
    })
  end
}

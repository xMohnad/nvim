return {
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "kevinhwang91/nvim-hlslens",
    },
    opts = {
      handlers = {
        gitsigns = true,
        search = true,
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons", lazy = true } },
    event = "VeryLazy",
    opts = {},
  },
}

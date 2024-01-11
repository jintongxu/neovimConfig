return {
  "liuchengxu/vista.vim",

  -- vim.keymap.set("n", "<leader>mv", ":Vista<cr>", desc = "test1"),
  keys = {
    { "<leader>mv", "<cmd>Vista<cr>", desc = "Vista" },
    { "<leader>mc", "<cmd>Vista!<cr>", desc = "Vista!" },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        n = {
          ["<C-h>"] = "which_key",
          ["<C-q>"] = "send_selected_to_qflist"
        },
        i = {
          ["<C-q>"] = "send_selected_to_qflist"
        }
      }
    }
  }
}

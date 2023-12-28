return {
  {
    "natecraddock/workspaces.nvim",
    config = function()
      vim.keymap.set("n", "<leader>pp", ":Telescope workspaces<CR>", {
        desc = "workspaces",
      })
      require("workspaces").setup({
        auto_open = true,
        hooks = {
          add = {},
          remove = {},
          rename = {},
          open_pre = {
            function ()
              if not vim.g.workspaces_has_opened_project then
                -- If we haven't opened a project yet, do not save session
                -- Otherwise, if we'll end up saving over a session if we launch in a workspace
                return
              end
              local p = require("persistence")
              p.save()
              p.stop()
            end
          },
          open = {
            function()
              -- Close all buffers
              local bufs=vim.api.nvim_list_bufs()
              for _,i in ipairs(bufs) do
                vim.api.nvim_buf_delete(i,{})
              end
              local p = require("persistence")
              p.start()
              p.load()
              vim.g.workspaces_has_opened_project = true
            end,
          },
        },
      })
      require("telescope").load_extension("workspaces")
    end,
  },
}

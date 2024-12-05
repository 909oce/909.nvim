return {
  {
    "NOSDuco/remote-sshfs.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("remote-sshfs").setup {
        mounts = {
          base_dir = vim.fn.expand "$HOME/",
        },
        handlers = {
          on_disconnect = {
            clean_mount_folders = true,
          },
        },
        ui = {
          confirm = {
            connect = false,
          },
        },
      }
    end,
  },
}

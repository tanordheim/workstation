local tree_status_ok, tree = pcall(require, 'nvim-tree')
if not tree_status_ok then
  return
end

tree.setup {
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 200,
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
  root_folder_modifier = ':t',
  icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = '',
      staged = 'S',
      unmerged = '',
      renamed = '➜',
      deleted = '',
      untracked = 'U',
      ignored = '◌',
    },
    folder = {
      default = '',
      open = '',
      empty = '',
      empty_open = '',
      symlink = '',
    },
  }
}

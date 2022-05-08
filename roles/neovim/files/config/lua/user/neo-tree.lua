local tree_status_ok, tree = pcall(require, 'neo-tree')
if not tree_status_ok then
  return
end

tree.setup {
  filesystem = {
    filtered_items = {
      hide_dotfiles = false
    },
    follow_current_file = true,
    use_libuv_file_watcher = true
  }
}

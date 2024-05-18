
print('init lua called')
-- Configure vim-test options
-- vim.g["test#strategy"] = "vimux"


-- make test commands execute using dispatch.vim
-- let test#strategy = "vimux"
-- Configure vim-test options
-- let g:test#strategy = "jest"


-- Load vimux plugin (ensure it's loaded before vim-test)
lvim.cmd([[
    runtime vimux/plugin/vimux.vim
]])

-- Configure vim-test to use vimux as the runner
lvim.g["test#strategy"] = "vimux"

print('test strategy')
print(lvim.g)
-- Set vimux configuration
-- vim.g["vimux_runner"] = "tmux"  -- Use tmux as the runner
-- vim.g["vimux_height"] = "30%"   -- Set the height of the vimux window

-- Add additional configuration if needed
-- vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
-- vim.g["test#ruby#rspec#options"] = "--format documentation"

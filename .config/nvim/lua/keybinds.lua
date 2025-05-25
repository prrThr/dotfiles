-- nvim/lua/keybindings.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ---------------- BARBAR ---------------- --
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<Space>pp', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- ---------------- TELESCOPE ---------------- --
map('n', '<C-o>', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>', opts)

-- ---------------- NEO-TREE  ---------------- --
-- vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})

-- ---------------- LSP  ---------------- --
-- OBSOLETE vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded"}) end, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)

-- ---------------- TOGGLETERM ---------------- --
map('n', '<C-\\>', '<Cmd>ToggleTerm<CR>', opts)

-- ---------------- NEOSCROLL ---------------- --
local neoscroll = require('neoscroll')

local keymap = {
    ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250 }) end,
    ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250 }) end,
    ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450 }) end,
    ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450 }) end,
    ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
    ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
    ["zt"]    = function() neoscroll.zt({ half_win_duration = 250 }) end,
    ["zz"]    = function() neoscroll.zz({ half_win_duration = 250 }) end,
    ["zb"]    = function() neoscroll.zb({ half_win_duration = 250 }) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end

-- ---------------- NEOSCROLL DEPRECATED ----- --
--map('n', '<C-u>', '<Cmd>lua require("neoscroll").scroll(-vim.wo.scroll, true, 250)<CR>', opts)
--map('n', '<C-d>', '<Cmd>lua require("neoscroll").scroll(vim.wo.scroll, true, 250)<CR>', opts)
--map('n', '<C-b>', '<Cmd>lua require("neoscroll").scroll(-vim.api.nvim_win_get_height(0), true, 450)<CR>', opts)
--map('n', '<C-f>', '<Cmd>lua require("neoscroll").scroll(vim.api.nvim_win_get_height(0), true, 450)<CR>', opts)
--map('n', '<C-y>', '<Cmd>lua require("neoscroll").scroll(-0.10, false, 100)<CR>', opts)
--map('n', '<C-e>', '<Cmd>lua require("neoscroll").scroll(0.10, false, 100)<CR>', opts)
--map('n', 'zt', '<Cmd>lua require("neoscroll").zt(250)<CR>', opts)
--map('n', 'zz', '<Cmd>lua require("neoscroll").zz(250)<CR>', opts)
--map('n', 'zb', '<Cmd>lua require("neoscroll").zb(250)<CR>', opts)

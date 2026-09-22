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

-- ---------------- Split ------------------------

vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hs', ':split<CR>', { noremap = true, silent = true })

-- ---------------- Remove highlight search --- --

vim.keymap.set('n', '<leader>nhs', ':nohlsearch<CR>', { noremap = true, silent = true })

-- ---------------- GITSIGNS ---------------- --
local gitsigns = require('gitsigns')

-- Navigation
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    gitsigns.nav_hunk('next')
  end
end)

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    gitsigns.nav_hunk('prev')
  end
end)

-- Actions
vim.keymap.set('n', '<leader>ha', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)

vim.keymap.set('v', '<leader>ha', function()
  gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)

vim.keymap.set('v', '<leader>hr', function()
  gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)

vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer)
vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer)
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline)

vim.keymap.set('n', '<leader>hb', function()
  gitsigns.blame_line({ full = true })
end)

vim.keymap.set('n', '<leader>hd', gitsigns.diffthis)

vim.keymap.set('n', '<leader>hD', function()
  gitsigns.diffthis('~')
end)

vim.keymap.set('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
vim.keymap.set('n', '<leader>hq', gitsigns.setqflist)

-- Toggles
vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff)

-- Text object
vim.keymap.set({'o', 'x'}, 'ih', gitsigns.select_hunk)


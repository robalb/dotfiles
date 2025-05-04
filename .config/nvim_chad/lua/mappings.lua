require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nvim_tmux_nav = require('nvim-tmux-navigation')

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ 'n', 't', 'v', 'i' }, "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map({ 'n', 't', 'v', 'i' }, "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map({ 'n', 't', 'v', 'i' }, "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map({ 'n', 't', 'v', 'i' }, "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)

map("n", "<leader>t", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>h", ":noh<CR>", { desc = "Cancel highlight" })

-- Multiline word replacement:
-- shortcut for:
-- - searching a word
-- - changing it with cgn
-- - pressing dot to
-- repeat the action on the next word
map("n", "<leader>c", "*Ncgn", { desc = "Multiline word replacement" })
-- (this action was overwritten by our <leader>c)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", {desc = "telescope git commit"})
-- (this action was originally <leader>th but we disabled it)
map("n", "<leader>ft", "<cmd>Telescope themes<CR>", {desc = "telescope nvchad themes"})
-- fast access to / on non-US keyboards
map("n", "<leader><leader>", "/", {desc="/ search"})
map("n", "<leader>>", "<C-W>15>", {desc="vertical resize increase"})
map("n", "<leader><", "<C-W>15<", {desc="vertical resize decrease"})

-- LSP rename
map("n", "<leader>r", require "nvchad.lsp.renamer", {desc="LSP rename"})
-- LSP code action
map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", {desc="LSP code action"})
-- LSP show line error in float box
map("n", "<leader>l", "<cmd>lua vim.diagnostic.open_float()<CR>", {desc="LSP show line error"})
-- LSP signature / hover
map("n", "<leader>s", "<cmd>lua vim.lsp.buf.hover()<CR>", {desc="LSP signature / hover"})
-- LSP next error
map("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", {desc="error jump next"})
-- LSP prev error
map("n", "<leader>N", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {desc="error jump prev"})


-- Disable mappings
local nomap = vim.keymap.del

-- normally this would open the theme explorer,
-- but it makes the <leader>t command slower.
nomap("n", "<leader>th")
-- normally this would open the renamer, but we moved it to <leader>r
-- nomap("n", "<leader>ra") --BUG, cannot unmpa
-- normally this would toggle the relative line number, we dont use this.
nomap("n", "<leader>rn")


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

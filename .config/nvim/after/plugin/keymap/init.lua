local Remap = require("trungdvu.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap
local keymap = vim.keymap

vim.g.mapleader = ' '

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

nnoremap('x', '"_x')
-- Delete a word backwards
nnoremap('dw', 'vb"_d')

-- Select all
nnoremap('<C-a>', 'gg<S-v>G')

-- New tab
nnoremap('te', ':tabedit')
-- Split window
nnoremap('ss', ':split<Return><C-w>w')
nnoremap('sv', ':vsplit<Return><C-w>w')
-- Move window
nnoremap('<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

inoremap('kj', '<Esc>')

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
-- nnoremap("J", "6j")
-- nnoremap("K", "6k")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<leader>y", "\"+y")
nnoremap("<leader>d", "\"_d")
nmap("<leader>Y", "\"+Y")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

vnoremap("<leader>y", "\"+y")
vnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- javascript console log
xnoremap("<leader>l", ":put!=printf('console.log(''%s:'', %s);', expand('<cword>'), expand('<cword>'))<CR>")

return {
    -- ----------------------
    -- LSP and syntax plugins
    -- ----------------------
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- format on save
        opts = require "configs.conform",
    },

    -- ----------------------
    -- Mason autoinstallers
    -- for the plugins above
    -- ----------------------

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },

    -- --------------------
    -- Extra custom plugins
    -- --------------------

    {
        'mfussenegger/nvim-ansible',
        ft = "yml"
    },

    {
        'alexghergh/nvim-tmux-navigation',
        lazy = false, -- ensures it loads on startup
        config = function()
            require 'nvim-tmux-navigation'.setup {
                disable_when_zoomed = true, -- defaults to false
                keybindings = {
                    left = "<C-h>",
                    down = "<C-j>",
                    up = "<C-k>",
                    right = "<C-l>",
                    last_active = "<C-\\>",
                    next = "<C-Space>",
                }
            }
        end,
    },

    {
        "karb94/neoscroll.nvim",
        -- lazy load the first time one of these keys is pressed:
        keys = {
            { "<C-u>", nil},
            { "<C-d>", nil},
            { "<C-b>", nil},
            { "<C-f>", nil},
        },
        opts = {},
        config = function()
            require('neoscroll').setup({
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
                hide_cursor = true,
                stop_eof = true,
                use_local_scrolloff = false,
                respect_scrolloff = false,
                cursor_scrolls_alone = true,
                easing = "quadratic",
                pre_hook = nil,
                post_hook = nil,
            })
        end
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}

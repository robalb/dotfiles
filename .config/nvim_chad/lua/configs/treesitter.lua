local options = {
    ensure_installed = {
        "bash",
        "c",
        "asm",
        "cmake",
        "cpp",
        "make",

        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",

        -- infra
        "yaml",
        "hcl",
        "json",

        -- web
        "javascript",
        "typescript",
        "astro",
        "svelte",
        "css",
        "tsx",

        -- misc
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "python",
        "toml",
        "vim",
        "vimdoc",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

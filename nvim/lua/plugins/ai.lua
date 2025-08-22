return {
    "git@github.com:jackMort/ChatGPT.nvim.git",
    event = "VeryLazy",
    config = function()
        require("chatgpt").setup()
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim", -- optional
        "nvim-telescope/telescope.nvim"
    }
}


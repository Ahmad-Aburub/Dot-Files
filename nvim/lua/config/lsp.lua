-- Enable Langauge Servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("ruff")
vim.lsp.enable("pyright")

------------------------------------

-- Built-in LSP completion setup
local AutoComplete = {}

-- Keymaps for the completion menu
-- Change these to whatever you like
AutoComplete.menu_keys = {
    next_item = "<C-j>",      -- move down in menu
    prev_item = "<C-k>",      -- move up in menu
    confirm_item = "<CR>",    -- confirm selection
    trigger_menu = "<C-Space>"-- manually trigger completion
}

AutoComplete.setup = function()
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)

            -- Only enable if server supports completion
            if client:supports_method("textDocument/completion") then
                vim.opt.completeopt = { "menu", "menuone", "noinsert" }

                -- Enable built-in completion
                vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

                local opts = { buffer = ev.buf, silent = true }

                -- Navigation in the popup menu
                vim.keymap.set("i", AutoComplete.menu_keys.next_item, function()
                    return vim.fn.pumvisible() == 1 and "<C-n>" or AutoComplete.menu_keys.next_item
                end, { expr = true, buffer = ev.buf })

                vim.keymap.set("i", AutoComplete.menu_keys.prev_item, function()
                    return vim.fn.pumvisible() == 1 and "<C-p>" or AutoComplete.menu_keys.prev_item
                end, { expr = true, buffer = ev.buf })

                -- Confirm selection
                vim.keymap.set("i", AutoComplete.menu_keys.confirm_item, function()
                    return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
                end, { expr = true, buffer = ev.buf })

                -- Manual trigger (async safe)
                vim.keymap.set("i", AutoComplete.menu_keys.trigger_menu, function()
                    vim.schedule(function()
                        vim.lsp.completion.get()
                    end)
                end, opts)
            end
        end
    })
end

AutoComplete.setup()

------------------------------------

-- Virutal Diagnostics

local Virtual = {}

-- Default state
Virtual.enabled = false

-- Toggle virtual lines
Virtual.toggle = function()
    Virtual.enabled = not Virtual.enabled
    vim.diagnostic.config({
        virtual_lines = Virtual.enabled,
    })
    print("Virtual lines " .. (Virtual.enabled and "enabled" or "disabled"))
end

-- Initial setup
Virtual.setup = function()
    vim.diagnostic.config({
        virtual_text = true,     -- inline text beside code
        virtual_lines = false,   -- start disabled
        signs = true,            -- gutter signs
        underline = true,        -- underline issues
        update_in_insert = false -- don't update while typing
    })

    -- Optional keymap to toggle
    vim.keymap.set("n", "<leader>vl", Virtual.toggle, { desc = "Toggle virtual lines" })
end

Virtual.setup()

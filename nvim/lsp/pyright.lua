return {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { ".git", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true, -- enable auto-import suggestions
                typeCheckingMode = "basic",  -- or "strict" if you want more checks
                diagnosticMode = "workspace", -- analyze entire workspace
                useLibraryCodeForTypes = true,
            }
        }
    },

}

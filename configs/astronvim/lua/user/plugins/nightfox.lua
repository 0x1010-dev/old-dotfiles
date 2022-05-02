return {
    options = {
        dim_inactive = true,
        transparent = true,
        modules = {
            barbar = false,
            dashboard = true,
            fern = false,
            fidget = false,
            gitgutter = false,
            illuminate = false,
            lightspeed = false,
            lsp_saga = true,
            lsp_trouble = true,
            modes = false,
            neogit = false,
            nvimtree = false,
            pounce = false,
            sneak = false,
            symbols_outline = false
        }
    },
    groups = {
        MiniIndentscopeSymbol = { link = "PreProc" },
        NormalFloat = { link = "Normal" },
        -- TelescopeBorder = { bg = "bg1" },
        TelescopePromptCounter = { link = "TelescopePromptNormal" },
        TelescopePromptPrefix = { link = "TelescopePromptNormal" },
        HighlightURL = { style = "underline" },
        AerialLine = { link = "Search" },
        AerialGuide = { link = "NeoTreeIndentMarker" }
    }
}

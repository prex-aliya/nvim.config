-- https://lospec.com/palette-list/rust-gold-8
-- https://lospec.com/palette-list/ink-crimson
-- https://lospec.com/palette-list/cyclope6
-- https://lospec.com/palette-list/everglow-diamond
-- https://lospec.com/palette-list/sunraze
-- https://lospec.com/palette-list/cyberpunk-neons

function Color()
        local g = vim.g

        local black             = "#09010d"

        local medium_gray       = "#767676"
        local white             = "#F1F1F1"
        local actual_white      = "#FFFFFF"
        local subtle_black      = "#121212"
        local light_black       = "#262626"
        local lighter_black     = "#4E4E4E"
        local light_gray        = "#A8A8A8"
        local lighter_gray      = "#C6C6C6"
        local lightest_gray     = "#EEEEEE"
        local dark_pink         = "#ff5f87"
        local light_pink        = "#d75f87"
        local dark_red          = "#C30771"
        local light_red         = "#E32791"
        local orange            = "#D75F5F"
        local darker_blue       = "#005F87"
        local dark_blue         = "#008EC4"
        local blue              = "#20BBFC"
        local light_blue        = "#b6d6fd"
        local dark_cyan         = "#20A5BA"
        local light_cyan        = "#4FB8CC"
        local dark_green        = "#10A778"
        local light_green       = "#5FD7A7"
        local light_purple      = "#a790d5"
        local yellow            = "#F3E430"
        local light_yellow      = "#ffff87"
        local dark_yellow       = "#A89C14"

	vim.api.nvim_set_hl(0, "Normal", { bg = black })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = black })

end

Color()

-- set colorscheme
vim.o.termguicolors = true

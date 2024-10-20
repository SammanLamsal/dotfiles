local wezterm = require 'wezterm'
local config = {}

config.wsl_domains = {
	{
		name = "WSL:Ubuntu",
		distribution = "Ubuntu"
	},
}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu"

config.color_scheme = "Catppuccin Mocha"

config.window_background_opacity = .9
config.font = wezterm.font_with_fallback {
	"JetBrains Mono NL",
    "Fira Code",
}

config.font_size = 11
config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = false
--config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

return config

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

if wezterm.target_triple == "aarch64-apple-darwin" then
	config.default_domain = "DefaultDomain"
else
	config.default_domain = "WSL:Ubuntu"
end

config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
config.max_fps = 240
config.font = wezterm.font_with_fallback {
    "JetBrains Mono NL",
    "Fira Code",
}

config.keys = {
    {
        key = "O",
        mods = "CTRL|ALT",
        -- toggling opacity
        action = wezterm.action_callback(function(window, _)
            local overrides = window:get_config_overrides() or {}
            if overrides.window_background_opacity == 1.0 then
                overrides.window_background_opacity = 0.9
            else
                overrides.window_background_opacity = 1.0
            end
            window:set_config_overrides(overrides)
        end),
    }
}
config.font_size = 11
config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = false
--config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

return config
eturn configeturn config

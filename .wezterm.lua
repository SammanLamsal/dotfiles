local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

config.wsl_domains = {
    {
        name = "WSL:Ubuntu",
        distribution = "Ubuntu"
    },
}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
    -- this is set by the plugin, and unset on ExitPre in Neovim
    return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
    h = 'Left',
    j = 'Down',
    k = 'Up',
    l = 'Right',
}

local function split_nav(resize_or_move, key)
    return {
        key = key,
        mods = resize_or_move == 'resize' and 'META' or 'CTRL',
        action = wezterm.action_callback(function(win, pane)
            if is_vim(pane) then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
                }, pane)
            else
                if resize_or_move == 'resize' then
                    win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
                else
                    win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
                end
            end
        end),
    }
end

local pwsh_bindings = {
    {key = "LeftArrow" , mods = "OPT", action = act.SendString("\x1bb")},
    {key = "RightArrow", mods = "OPT", action = act.SendString("\x1bf")},

    -- Window management
    {key="a",  mods="LEADER", action=act{SendString="`"}},
    {key="raw:222",  mods="SHIFT|LEADER", action=act{SplitVertical={domain="CurrentPaneDomain"}} },
    {key="%", mods="SHIFT|LEADER", action=act.SplitHorizontal{domain="CurrentPaneDomain"}},
    {key="z" , mods="LEADER", action="TogglePaneZoomState" },
    {key="c" , mods="LEADER", action=act{SpawnTab="CurrentPaneDomain"}},

    {key="`", mods="LEADER", action=act.ActivateLastTab},
    {key=" ", mods="LEADER", action=act.ActivateTabRelative(1)},
    {key="1", mods="LEADER", action=act{ActivateTab=0}},
    {key="2", mods="LEADER", action=act{ActivateTab=1}},
    {key="3", mods="LEADER", action=act{ActivateTab=2}},
    {key="4", mods="LEADER", action=act{ActivateTab=3}},
    {key="5", mods="LEADER", action=act{ActivateTab=4}},
    {key="6", mods="LEADER", action=act{ActivateTab=5}},
    {key="7", mods="LEADER", action=act{ActivateTab=6}},
    {key="8", mods="LEADER", action=act{ActivateTab=7}},
    {key="9", mods="LEADER", action=act{ActivateTab=8}},
    {key="x", mods="LEADER", action=act{CloseCurrentPane={confirm=true}}},

    split_nav('move', 'h'),
    split_nav('move', 'j'),
    split_nav('move', 'k'),
    split_nav('move', 'l'),
    -- resize panes
    split_nav('resize', 'h'),
    split_nav('resize', 'j'),
    split_nav('resize', 'k'),
    split_nav('resize', 'l'),

}

if wezterm.target_triple == "aarch64-apple-darwin" then
    config.default_domain = "local"
    config.font_size = 16
    config.leader = nil
    config.keys = {}
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    config.default_domain = "local"
    config.font_size = 11
    config.leader = nil
    config.keys = {}
elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { 'powershell.exe' }
    config.font_size = 11
    config.leader = { key="Space", mods="CTRL", timeout_milliseconds=1000 }
    config.keys = pwsh_bindings
else
    config.keys = {}
    config.leader = nil
end

config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
config.max_fps = 240
config.font = wezterm.font_with_fallback {
    "JetBrains Mono NL",
    "Fira Code",
}

local universal_binds = {
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

for _, bind in ipairs(universal_binds) do
    table.insert(config.keys, bind)
end

config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = false
--config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

return config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
config.colors = {
  foreground = "#ebb678",
  background = "#09060d",
  cursor_bg = "#47FF9C",
  cursor_border = "#47FF9C",
  cursor_fg = "#011423",
  selection_bg = "#033259",
  selection_fg = "#CBE0F0",
  ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
  brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 10

wezterm.on('gui-startup', function(cmd)
  -- Spawn a new window
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})

  -- Set the specific size for the window (width x height in pixels)
  if window and window:gui_window() then
    window:gui_window():set_inner_size(1920, 1080)  -- Tamaño de 1920x1080
  else
    wezterm.log_error("No se pudo ajustar el tamaño de la ventana.")
  end
end)

config.native_macos_fullscreen_mode = true

-- and finally, return the configuration to wezterm
return config


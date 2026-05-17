local globals = require("hyprland.globals")

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		float_gaps = { top = 20, right = 0, bottom = 0, left = 0 },
		border_size = 1,
		["col.active_border"] = globals.fg,
		["col.inactive_border"] = globals.bg,
		resize_on_border = true,
		allow_tearing = false,
		layout = "hy3",
	},
	decoration = {
		rounding = 0,
		shadow = { enabled = false },
		blur = { enabled = false },
	},
	input = {
		kb_layout = "us,ir",
		kb_options = "grp:caps_toggle",
	},
	cursor = {
		no_warps = true,
		zoom_detached_camera = false,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},
	binds = {
		allow_pin_fullscreen = true,
		scroll_event_delay = 10,
	},
	ecosystem = {
		no_donation_nag = true,
	},
	plugin = {
		hy3 = {
			tabs = {
				height = 20,
				padding = 0,
				radius = 0,
				border_width = 1,
				text_height = 10,
				text_padding = 0,
				blur = false,
				colors = {
					active = globals.fg,
					active_border = globals.fg,
					active_text = globals.bg,
					active_alt_monitor = globals.bg,
					active_alt_monitor_border = globals.fg,
					active_alt_monitor_text = globals.fg,
					focused = globals.bg,
					focused_border = globals.fg,
					focused_text = globals.fg,
					inactive = globals.bg,
					inactive_border = globals.bg,
					inactive_text = globals.fg,
					urgent = globals.red,
					urgent_border = globals.red,
					urgent_text = globals.bg,
				},
			},
		},
	},
})

hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "default" })

hl.monitor({
	output = "eDP-1",
	mode = "2560x1600@60",
	position = "0x0",
	scale = "1.6",
})
hl.monitor({
	output = "HDMI-A-5",
	mode = "3840x2160@60",
	position = "1600x0",
	scale = "1.875",
})

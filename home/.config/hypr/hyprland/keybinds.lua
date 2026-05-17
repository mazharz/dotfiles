local globals = require("hyprland.globals")
local hy3 = hl.plugin.hy3

----------------------------------------------------------------------
-- menus
----------------------------------------------------------------------
hl.bind(
	"SUPER + d",
	hl.dsp.exec_cmd(
		globals.terminal
			.. [[ --class launcher-menu -e sh -c 'j4-dmenu-desktop --no-exec --dmenu=fzf | xargs -I{} hyprctl dispatch '\''hl.dsp.exec_cmd("{}")'\']]
	)
)
hl.bind("SUPER + o", hl.dsp.exec_cmd(globals.terminal .. " --class macro-menu -e ~/bin/macro"))
hl.bind("SUPER + e", hl.dsp.exec_cmd(globals.terminal .. " --class emoji-menu -e ~/bin/emoji-picker"))
hl.bind("SUPER + p", hl.dsp.exec_cmd("copyq show"))

----------------------------------------------------------------------
-- programs
----------------------------------------------------------------------

hl.bind("SUPER + return", hl.dsp.exec_cmd(globals.terminal))
hl.bind("SUPER + ALT + f", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + ALT + e", hl.dsp.exec_cmd("thunar"))
hl.bind("SUPER + ALT + t", hl.dsp.exec_cmd("Telegram"))
hl.bind("SUPER + ALT + m", hl.dsp.exec_cmd(globals.terminal .. " --class ncmpcpp -e ncmpcpp -q"))
hl.bind("SUPER + ALT + p", hl.dsp.exec_cmd("postman"))
hl.bind("SUPER + ALT + c", hl.dsp.exec_cmd("~/bin/clocks"))
hl.bind("SUPER + ALT + q", hl.dsp.exec_cmd(globals.terminal .. " --class qalculate-terminal -e qalc"))
hl.bind("SUPER + ALT + return", hl.dsp.exec_cmd(globals.terminal .. " -e lf"))
hl.bind("SUPER + ALT + n", hl.dsp.exec_cmd(globals.terminal .. " --class markdown-notes -e t"))
hl.bind(
	"SUPER + ALT + SHIFT + t",
	hl.dsp.exec_cmd("systemctl --user start break-timer.service; pkill -SIGRTMIN+8 waybar")
)
hl.bind(
	"SUPER + CTRL + ALT + t",
	hl.dsp.exec_cmd("systemctl --user stop break-timer.service; pkill -SIGRTMIN+8 waybar")
)
hl.bind("SUPER + ALT + h", hl.dsp.exec_cmd("~/builds/Hubstaff/HubstaffClient.bin.x86_64"))
hl.bind("SUPER + ALT + v", hl.dsp.exec_cmd(globals.terminal .. " --class xvpn -e sudo xvpn ui"))
hl.bind("SUPER + ALT + d", hl.dsp.exec_cmd("XDG_CURRENT_DESKTOP=GNOME mongodb-compass"))
hl.bind("SUPER + ALT + b", hl.dsp.exec_cmd(globals.terminal .. " -e btm"))
hl.bind("SUPER + ALT + o", hl.dsp.exec_cmd("/opt/oblivion-desktop/oblivion-desktop --no-sandbox --gtk-version=3"))

----------------------------------------------------------------------
-- window
----------------------------------------------------------------------

hl.bind("SUPER + q", hl.dsp.window.kill())

-- layout
hl.bind("SUPER + f", hl.dsp.window.fullscreen())
hl.bind("SUPER + space", hy3.toggle_focus_layer())
hl.bind("SUPER + SHIFT + space", hl.dsp.window.float())
hl.bind("SUPER + SHIFT + p", hl.dsp.window.pin())

hl.bind("SUPER + b", hy3.make_group("h"))
hl.bind("SUPER + v", hy3.make_group("v"))
hl.bind("SUPER + t", hy3.change_group("toggletab"))
hl.bind("SUPER + g", hy3.change_group("opposite"))
hl.bind("SUPER + a", hy3.change_focus("raise"))
hl.bind("SUPER + z", hy3.change_focus("lower"))

-- move focus
hl.bind("SUPER + h", hy3.move_focus("l"))
hl.bind("SUPER + l", hy3.move_focus("r"))
hl.bind("SUPER + k", hy3.move_focus("u"))
hl.bind("SUPER + j", hy3.move_focus("d"))
hl.bind("SUPER + left", hy3.move_focus("l"))
hl.bind("SUPER + right", hy3.move_focus("r"))
hl.bind("SUPER + up", hy3.move_focus("u"))
hl.bind("SUPER + down", hy3.move_focus("d"))

-- # move window
hl.bind("SUPER + SHIFT + h", hy3.move_window("l"))
hl.bind("SUPER + SHIFT + l", hy3.move_window("r"))
hl.bind("SUPER + SHIFT + k", hy3.move_window("u"))
hl.bind("SUPER + SHIFT + j", hy3.move_window("d"))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- resize window
hl.bind("SUPER + CTRL + h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind("SUPER + CTRL + l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind("SUPER + CTRL + k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind("SUPER + CTRL + j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))
hl.bind("SUPER + CTRL + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

----------------------------------------------------------------------
-- workspaces
----------------------------------------------------------------------

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
	hl.bind("SUPER + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + period", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + comma", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + SHIFT + period", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + comma", hl.dsp.window.move({ workspace = "e-1" }))

-- move workspace to desktop
hl.bind("SUPER + CTRL + SHIFT + h", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("SUPER + CTRL + SHIFT + l", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("SUPER + CTRL + SHIFT + k", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind("SUPER + CTRL + SHIFT + j", hl.dsp.workspace.move({ monitor = "d" }))

----------------------------------------------------------------------
-- sound
----------------------------------------------------------------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SUPER + ALT + i",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SUPER + ALT + k",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SUPER + ALT + mouse_down",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SUPER + ALT + mouse_up",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)

----------------------------------------------------------------------
-- music
----------------------------------------------------------------------

hl.bind("SUPER + ALT + period", hl.dsp.exec_cmd("mpc next; pkill -SIGRTMIN+7 waybar"), { locked = true })
hl.bind("SUPER + ALT + comma", hl.dsp.exec_cmd("mpc prev; pkill -SIGRTMIN+7 waybar"), { locked = true })
hl.bind("SUPER + ALT + mouse_right", hl.dsp.exec_cmd("mpc next; pkill -SIGRTMIN+7 waybar"), { locked = true })
hl.bind("SUPER + ALT + mouse_left", hl.dsp.exec_cmd("mpc prev; pkill -SIGRTMIN+7 waybar"), { locked = true })
hl.bind("SUPER + ALT + j", hl.dsp.exec_cmd("mpc toggle; pkill -SIGRTMIN+7 waybar"), { locked = true })
hl.bind("SUPER + ALT + mouse:274", hl.dsp.exec_cmd("mpc toggle; pkill -SIGRTMIN+7 waybar"), { locked = true })
hl.bind(
	"SUPER + ALT + bracketleft",
	hl.dsp.exec_cmd("mpc seek -10; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SUPER + ALT + bracketright",
	hl.dsp.exec_cmd("mpc seek +10; pkill -SIGRTMIN+7 waybar"),
	{ locked = true, repeating = true }
)

----------------------------------------------------------------------
-- notification
----------------------------------------------------------------------

hl.bind("SUPER + CTRL + space", hl.dsp.exec_cmd("dunstctl close"))
hl.bind("SUPER + CTRL + SHIFT + space", hl.dsp.exec_cmd("dunstctl history-pop"))
hl.bind("SUPER + CTRL + return", hl.dsp.exec_cmd("dunstctl action"))
hl.bind("SUPER + CTRL + ALT + space", hl.dsp.exec_cmd("dunstctl set-paused toggle; exec pkill -SIGRTMIN+10 waybar"))

----------------------------------------------------------------------
-- screenshot
----------------------------------------------------------------------

hl.bind("SUPER + x", hl.dsp.exec_cmd('grim -g "$(slurp)" -t ppm - | satty --filename -'))
hl.bind("SUPER + ALT + x", hl.dsp.exec_cmd('grim -g "$(slurp -o -r)" -t ppm - | satty --filename -'))

----------------------------------------------------------------------
-- brightness
----------------------------------------------------------------------

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

----------------------------------------------------------------------
-- desktop zoom
----------------------------------------------------------------------

hl.bind("SUPER + SHIFT + mouse_up", function()
	hl.config({ cursor = { zoom_factor = 1 } })
end, { mouse = true })
hl.bind("SUPER + SHIFT + mouse_down", function()
	hl.config({ cursor = { zoom_factor = 3 } })
end, { mouse = true })
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })

----------------------------------------------------------------------
-- misc
----------------------------------------------------------------------

-- ip location renewal
hl.bind("SUPER + ALT + l", hl.dsp.exec_cmd("pkill -SIGRTMIN+9 waybar"))

-- lock screen
hl.bind("SUPER + ALT + semicolon", hl.dsp.exec_cmd("hyprlock"))

-- exit hyprland
hl.bind(
	"SUPER + SHIFT + q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

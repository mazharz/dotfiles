hl.window_rule({ match = { class = "^(mpv)$" }, float = true, pin = true })
hl.window_rule({ match = { class = "^(thunar)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(macro-menu)$" }, float = true })
hl.window_rule({ match = { class = "^(emoji-menu)$" }, float = true })
hl.window_rule({ match = { class = "^(qalculate-terminal)$" }, float = true })
hl.window_rule({ match = { class = "^(com.github.hluk.copyq)$" }, float = true })
hl.window_rule({ match = { class = "^(launcher-menu)$" }, float = true })
hl.window_rule({ match = { class = "^(xvpn)$" }, workspace = 1 })
hl.window_rule({ match = { class = "^(markdown-notes)$" }, workspace = 2 })
hl.window_rule({ match = { class = "^(firefox)$" }, workspace = 3 })
hl.window_rule({ match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" }, float = true, pin = true })
hl.window_rule({ match = { class = "^(org.telegram.desktop)$" }, workspace = 6 })
hl.window_rule({
	match = { class = "^(org.telegram.desktop)$", title = "^(Media viewer)$" },
	float = true,
	fullscreen = true,
})
hl.window_rule({ match = { class = "^(MongoDB Compass)$" }, workspace = 7 })
hl.window_rule({ match = { class = "^(Postman)$" }, workspace = 8 })
hl.window_rule({ match = { class = "^(Altair GraphQL Client)$" }, workspace = 8 })
hl.window_rule({ match = { class = "^(ncmpcpp)$" }, workspace = 9 })
hl.window_rule({ match = { class = "^(Netsoft-com.netsoft.hubstaff)$" }, workspace = 10 })

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1.33", -- 1.33 is perfect on laptop monitor
})

hl.exec_cmd("hyprctl keyword layerrule blur, rofi")
hl.exec_cmd("hyprctl keyword layerrule ignorezero, rofi")

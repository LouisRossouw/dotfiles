-------------------
---- AUTOSTART -- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-------------------

local autostart_apps = {
	"hyprpolkitagent",
	"hyprpaper",
	"waybar",
	"dunst",
}

local function run_once(cmd)
	hl.exec_cmd("sleep 1; pkill " .. cmd .. " || true; " .. cmd .. " &")
end

-- Ensure compositor is ready
hl.on("hyprland.start", function()
	for i, app in ipairs(autostart_apps) do
		run_once(app)
	end
end)

local programs = require("lua.programs")
local config = require("config")

local mainMod = config.mainMod

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(programs.terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(programs.launcher))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("command hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- hl.bind(mainMod .. " + I", function()
-- 	hl.dispatch(hl.dsp.exec_cmd(launcher))
-- end)

local directions = {
	left = { x = -20, y = 0 },
	right = { x = 20, y = 0 },
	up = { x = 0, y = -20 },
	down = { x = 0, y = 20 },
}

for dir, coords in pairs(directions) do
	-- We use .. to join mainMod, the extra modifier, and the direction string
	hl.bind(
		mainMod .. " + CTRL + " .. dir,
		hl.dsp.window.resize({
			x = coords.x,
			y = coords.y,
			relative = true,
		})
	)
end

-- Move focused window tiles
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

local function run_once(cmd)
	hl.exec_cmd("pkill " .. cmd .. "; " .. cmd .. " &")
end

run_once("hyprpolkitagent")
run_once("waybar")
run_once("dunst")

-- Sourcing config files.
require("settings")
require("plugins")
require("theme")
require("maps")

-- Local config files.
local user_settings_file = require("user_settings")
user_settings_file.other_configs()


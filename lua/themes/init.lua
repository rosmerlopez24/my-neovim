local config = require("core.utils").load_config().config
local supported_themes = require("themes.supported").supported_themes

for _, value in ipairs(supported_themes) do
  if value == config.theme then
    require("themes.integrated." .. config.theme).load()
    return
  end
end

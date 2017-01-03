function get_config(config_path)
  local f = io.open(config_path, "rb")
  local yaml = require("yaml")

  if f then
    local content = f:read("*all")
    f:close()
    return yaml.load(content)
  end

  return {}
end

function get_colors(config_path)
  local config = get_config(config_path)
  local colors = config["colors"]

  return colors
end

function parse_colors(config_path)
  local colors = get_colors(config_path)

  for k,v in pairs(colors) do
    local color = string.match(v, '[0-9A-Z]+')
    --tex.print('\definecolor{' ..k.. 'color}{HTML}{' ..v.. '}')
    print('\\definecolor{' ..k.. 'color}{HTML}{' ..color.. '}')
  end
end

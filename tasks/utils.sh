# GENERATE COLOR FROM CUSTOM CONFIG FOR LATEX
# CANNOT BE ADDED INTO LATEX COMMANDS BECAUSE OF THE FUCKING INCOMPATIBILITY BETWEEN LUALATEX AND LUAROCKS
function gen_colors {
  lua -e "dofile('commands/config_commands.lua'); parse_colors('config.yaml')"
}

echo "## GENERATED COLORS FROM CONFIG ##"
gen_colors

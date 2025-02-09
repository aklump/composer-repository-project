# Bootstrap
! [ -e "$__DIR__/../inc/_bootstrap.sh" ] && echo && echo "❌ Not built; try \`bump build\`." && echo && exit 1
source "$__DIR__/../inc/_bootstrap.sh"

# Manipulate the path for the framework
path=$(echo "$path" | sed "s|^$ROOT|$FRAMEWORK_DIR|")
if [[ ! "$path" =~ \.[^/]+$ ]]; then
  path="${path}.sh"
fi

# Check for then execute the framework file
! [ -e "$path" ] && echo && echo "❌ Missing framework; try \`composer install\`." && echo && exit 1
source "$path"

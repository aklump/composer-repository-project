! [ -e "$__DIR__/../inc/_bootstrap.sh" ] && echo && echo "❌ Not built; try \`bump build\`." && echo && exit 1
source "$__DIR__/../inc/_bootstrap.sh"
source "${FRAMEWORK_DIR}bin/$basename"

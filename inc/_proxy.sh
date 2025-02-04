! [ -e "$__DIR__/../inc/_bootstrap.sh" ] && echo && echo "❌ Not built; try \`bump build\`." && echo && exit 1
source "$__DIR__/../inc/_bootstrap.sh"
! [ -e "${FRAMEWORK_DIR}bin/$basename" ] && echo && echo "❌ Missing dependencies; try \`composer install\`." && echo && exit 1
source "${FRAMEWORK_DIR}bin/$basename"

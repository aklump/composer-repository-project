#!/usr/bin/env bash
s="${BASH_SOURCE[0]}";[[ "$s" ]] || s="${(%):-%N}";while [ -h "$s" ];do d="$(cd -P "$(dirname "$s")" && pwd)";s="$(readlink "$s")";[[ $s != /* ]] && s="$d/$s";done;__DIR__=$(cd -P "$(dirname "$s")" && pwd)
source "$__DIR__/../inc/_bootstrap.sh"

cd "$ROOT"

composer install

rsync -arv "$FRAMEWORK_DIR/data/" ./data --exclude=satis.json
rsync -arv $FRAMEWORK_DIR/web/ ./web
rm ./web/api/packages.php
cp $FRAMEWORK_DIR/install/packages.php ./web/api/

source "$FRAMEWORK_DIR/bin/$(basename "$s")"

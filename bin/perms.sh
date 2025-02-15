#!/usr/bin/env bash
s="${BASH_SOURCE[0]}";[[ "$s" ]] || s="${(%):-%N}";while [ -h "$s" ];do d="$(cd -P "$(dirname "$s")" && pwd)";s="$(readlink "$s")";[[ $s != /* ]] && s="$d/$s";done;__DIR__=$(cd -P "$(dirname "$s")" && pwd)

chmod u+x "$__DIR__/bind_book.sh"
chmod u+x "$__DIR__/check_config"
chmod u+x "$__DIR__/install"
chmod u+x "$__DIR__/on_cron"
chmod u+x "$__DIR__/rebuild"
chmod u+x "$__DIR__/start_dev_server"

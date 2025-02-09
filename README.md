# Composer Repository

## Install

* `composer create-project aklump/composer-repository:@dev app --repository="{\"type\":\"github\",\"url\": \"https://github.com/aklump/composer-repository\"}"`
* `bin/install.sh`
* Follow prompts for configuration.
* Check config with `bin/check_config.sh`
* Build with `bin/rebuild.sh`

## Other Commands

* `bin/start_dev_server.sh`

## Cron

$FRAMEWORK_DIR/bin/on_cron.php

## satis.json

* Never alter _data/satis.json_ directly.
* To update name or homepage, you must edit _satis.json_

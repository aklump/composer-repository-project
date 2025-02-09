<!--
id: readme
tags: ''
-->

# Composer Repository

## Install

* `{{ composer.create_project|raw }}`
* `cd app && bin/install.sh`
* Open the configuration file and replace tokens as shown.
* Check config using `bin/check_config.sh`
* Build repository using `bin/rebuild.sh`

## Other Commands

* `bin/start_dev_server.sh`

## Cron

$FRAMEWORK_DIR/bin/on_cron.php

## satis.json

* Never alter _data/satis.json_ directly.
* To update name or homepage, you must edit _satis.json_

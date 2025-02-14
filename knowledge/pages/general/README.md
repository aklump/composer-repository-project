<!--
id: readme
tags: ''
-->

# {{ book.title }}

## Install

> I suggest you follow these installation steps directly on the server where you will be hosting your repository, i.e., `REPOSITORY_URL`.

* `{{ composer.create_project|raw }}`
* `cd app && bin/install`
* Open the configuration files and replace tokens as shown.
* Repository URL is the public URL where you are hosting the repository, it is not a GitHub project!
* Check config using `bin/check_config`
* Build repository using `bin/rebuild`
* Visit `REPOSITORY_URL` to review build.

## Other Commands

* `bin/start_dev_server`

## Cron

$FRAMEWORK_DIR/bin/on_cron.php

## satis.json

* Never alter _data/satis.json_ directly.
* To update name or homepage, you must edit _satis.json_

## Requirements

* Composer

# Composer Repository Project

## Install

> I suggest you follow these installation steps directly on the server where you will be hosting your repository, i.e., the REPOSITORY_URL.

* `composer create-project aklump/composer-repository-project:@dev app --repository="{\"type\":\"github\",\"url\": \"https://github.com/aklump/composer-repository-project\"}"`
* `cd app && bin/install`
* Open the configuration files and replace tokens as shown.
* Repository URL is the public URL where you are hosting the repository, it is not a GitHub project!
* Check config using `bin/check_config`
* `chmod ugo-w .env`  
* Build repository using `bin/rebuild`
* Visit the REPOSITORY_URL to review build.

## Finish Installation

* Create a cronjob with the desired publish frequency, e.g.,
    ```
    */15 * * * 1-6 /PATH/TO/app/bin/on_cron 1>/dev/null 2> >(mail -s "Cronjob Error" your_email@example.com) 
    ```

## Add Your First Package

PackagesResource are adding by creating a GitHub webhook.

1. Navigate to the GitHub repository for the package you want to reportChanges.
1. Settings > Webhooks > Add webhook
1. Set url to the REPOSITORY_URL plus `/api/packages.php`
1. Content type: `application/json`
1. Set the Secret
1. Let me select individual events
1. Branch or tag creation
1. Branch or tag deletion
1. PackagesResource will appear after the next cron run. To accelerate the process manually execute `app/bin/on_cron.php`

## Other Commands

* `bin/start_dev_server`

## satis.json

* Never alter _data/satis.json_ directly.
* To update name or homepage, you must edit _satis.json_

## Requirements

* Composer

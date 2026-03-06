# Composer Repository Project

![Hero image](images/hero.jpg)

## Summary

A wrapper for [composer/satis](https://composer.github.io/satis/) to make hosting your own Composer repository from GitHub packages easier. This allows you to **add only one repository entry** for all your custom packages you might want to use on a project, rather than many.

Like this:

```json
{
  "repositories": [
    {
      "type": "composer",
      "url": "https://packages.website.com"
    }
  ]
}
```

## Install

> Follow these installation steps directly on the server where you will be hosting your private repository.

* `composer create-project aklump/composer-repository-project:@dev app --repository="{\"type\":\"github\",\"url\": \"https://github.com/aklump/composer-repository-project\"}"`
* `cd app && bin/install`
* Open the configuration files and replace tokens as shown.
* Repository URL is the public URL where you are hosting the repository, it is not a GitHub project!
* Check config using `app/bin/check_config`
* `chmod ugo-w .env`
* Build repository using `app/bin/rebuild`
* Visit the private repository URL to review build.

## Configuration

Run `app/bin/check_config` at any time.

### `app/.env`

The main configuration file

### `app/satis.json`

This file serves as [the base](https://composer.github.io/satis/config) when your repository is built. Namely use to set the name or homepage of your private repository.

### Auto-generated

Do not edit contents of these directories or you will loose your changes.

* `app/web`
* `app/data`

## Cron

The webhooks from Github will deliver data when they do, however, your private repository won't reflect the changes until it gets rebuilt. How often that occurs depends on the `on_cron` command configuration as shown below. You must setup a cronjob for automated rebuilds.

* Create a cronjob with the desired publish frequency, e.g.,
    ```
    */15 * * * 1-6 /PATH/TO/app/bin/on_cron 2>&1 || mail -s "Cronjob Error" your_email@example.com)
    ```

## Add a Package

New packages are adding by creating a GitHub webhook.

1. Navigate to the GitHub repository for the package you want to add.
1. Settings > Webhooks > Add webhook
1. Set URL to the private repository URL appending `/api/packages.php`, e.g., `http://packages.intheloftstudios.com/api/packages.php`
1. Set Content type: `application/json`
1. Set the `secret` (find it in `.env` on your repository server).
1. Choose: `Let me select individual events`
1. Select `Branch or tag creation`
1. Select `Branch or tag deletion`
1. Wait for cron, or trigger it manually using `app/bin/on_cron.php`

### Inspect GitHub Webhook Deliveries

The incoming data (from webhooks) are appended to `data/packages.log` on the private repository server. You may open that file to review.

## Remove a Package

To manually remove a package from your private repository:

1. For the package you will remove, delete its github.com webhook you created originally, the one that points to your REPOSITORY_URL
2. Shell in to your private repository server run `app/bin/remove <package_url>`
3. Then run `app/bin/rebuild`

## How to Upgrade

This must be done on your server, where you created the project.  You literally create a new project and copy over the old configuration.

```shell
mv app app.previous
composer create-project aklump/composer-repository-project:@dev app --repository="{\"type\":\"github\",\"url\": \"https://github.com/aklump/composer-repository-project\"}"
app/bin/install
mv app.previous/.env app/
mv app.previous/satis.json app/
rm -r app/data
mv app.previous/data app/
app/bin/check_config
app/bin/rebuild
```

After testing your result you may delete `app.previous`

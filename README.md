# Composer Repository Project

![Hero image](images/hero.jpg)

## Summary

A wrapper for [composer/satis](https://composer.github.io/satis/) that makes it easier to host your own Composer repository for GitHub packages. It lets you **add a single repository entry** for all of your custom packages instead of maintaining many separate entries.

For example:

```
json
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

> Follow these installation steps directly on the server where you will host your private repository.

```
shell
composer create-project aklump/composer-repository-project:^0.0 app --repository='{"type":"github","url": "https://github.com/aklump/composer-repository-project"}'
app/bin/install
```

After installation:

* Open the configuration files and replace the placeholder tokens shown in the command output.
* The repository URL is the public URL where your Composer repository is hosted; it is **not** the URL of an individual GitHub project.
* Check your configuration using `app/bin/check_config`.
* Lock down your configuration file: `chmod ugo-w .env`
* Build the repository using `app/bin/rebuild`.
* Visit the repository URL in a browser to confirm the build completed successfully.

## Configuration

Run `app/bin/check_config` at any time to validate your configuration.

### `app/.env`

The main configuration file.

### `app/satis.json`

This file serves as [the base Satis configuration](https://composer.github.io/satis/config) used when your repository is built. Use it to define things such as the repository name and homepage.

### Auto-generated

Do not edit the contents of these directories or you will lose your changes.

* `app/web`
* `app/data`

## Cron

GitHub webhooks deliver package event data, but your private repository will not reflect those changes until it is rebuilt. How often that happens depends on how you schedule `on_cron`. You must set up a cron job for automated rebuilds.

For example:

```
text
*/15 * * * 1-6 /PATH/TO/app/bin/on_cron 2>&1 || mail -s "Cronjob Error" your_email@example.com
```

## Add a Package

Packages are added by creating a GitHub webhook.

1. Go to **Settings > Webhooks > Add webhook**.
2. Set the URL to `{repository}/api/packages.php`, for example: `https://packages.example.com/api/packages.php`
3. Set **Content type** to `application/json`.
4. Set the `secret` value using the one found in `.env` on your repository server.
5. Select **Enable SSL verification**.
6. Choose **Let me select individual events**.
7. Select **Branch or tag creation**.
8. Select **Branch or tag deletion**.
9. Click **Add webhook**.
10. Wait for cron to run, or trigger it manually using `app/bin/on_cron`.

### Inspect GitHub Webhook Deliveries

Incoming webhook data is appended to `data/packages.log` on the private repository server. You can review that file to inspect deliveries.

## Remove a Package

To manually remove a package from your private repository:

1. Delete the GitHub webhook you originally created for that package — the one pointing to your repository URL.
2. SSH into your private repository server and run `app/bin/remove <package_url>`.
3. Run `app/bin/rebuild`.

## How to Upgrade

To update dependencies:

```
shell
cd app
composer update
```

To update `aklump/composer-repository-project` itself to a newer version, recreate the project and copy over your existing configuration. Run the following on the server where the project is installed:

```
shell
mv app app.previous
composer create-project aklump/composer-repository-project:^0.0 app --repository='{"type":"github","url": "https://github.com/aklump/composer-repository-project"}'
app/bin/install
mv app.previous/.env app/
mv app.previous/satis.json app/
rm -r app/data
mv app.previous/data app/
app/bin/check_config
app/bin/rebuild
```

After testing, you may delete `app.previous`.

## Backup

The following commands create a zip archive containing the minimum data required to recreate your project. Log files are not included.

```
shell
app/bin/backup
app/bin/backup --output=my_backup
```

## Support My Open Source Work

If you’ve found this project useful, please consider supporting its ongoing maintenance. Even a small contribution helps fund updates, fixes, and new ideas.


  * [Sponsor on GitHub](https://github.com/sponsors/aklump)

  * [Buy Me a Coffee](https://buymeacoffee.com/aklump)

  * [Donate via PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=4E5KZHDQCEUV8&item_name=Open%20Source%20Sponsorship)

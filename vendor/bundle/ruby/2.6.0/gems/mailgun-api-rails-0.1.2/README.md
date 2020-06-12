# Mailgun API Action Mailer Adapter
A simple [Mailgun](https://mailgun.com) API [Action Mailer](https://github.com/rails/rails/tree/master/actionmailer) adapter.

The alternatives try to recreate `The Matrix`, while others just utilize the `config.action_mailer.delivery_method = :smtp`. Why make a `gem` for that? Here is what Mailgun says ["Send with SMTP or API"](https://documentation.mailgun.com/quickstart-sending.html#send-with-smtp-or-api).

## Install

Plop the gem into your `Gemfile`.
```
gem 'mailgun-api-rails'
```

Run the `bundle` command.
```
$ bundle
```

Set the `delivery_method` to `:mailgun` in `config/application.rb` or your environment specific configuration. When it comes to the `mailgun_settings`, I just map them from my `.env` file
```
config.action_mailer.delivery_method = :mailgun

## Settings
config.action_mailer.mailgun_settings = {
  domain:       ENV['MAILGUN_DOMAIN'],
  api_key:      ENV['MAILGUN_API_KEY'],       
  api_base_url: ENV['MAILGUN_API_BASE_URL']   ## api.mailgun.net/v3
}
```

Boom. Done. Works with `devise_mail` as well.


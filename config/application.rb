require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsEmailConfirmationProject
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.action_mailer.delivery_method = :mailgun

    ## Settings
    config.action_mailer.mailgun_settings = {
      domain:       ENV['MAILGUN_DOMAIN'],
      api_key:      ENV['MAILGUN_API_KEY'],       
      api_base_url: ENV['MAILGUN_API_BASE_URL']   ## api.mailgun.net/v3
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end


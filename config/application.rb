require_relative "boot"

# require "rails/all"
%w(
  active_record/railtie
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  rails/test_unit/railtie
  sprockets/railtie
  action_cable/engine

).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RemeshLite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    config.generators do |generate|
      generate.test_framework  :rspec,
            fixtures: true,
            view_specs: true,
            helper_specs: false,
            routing_specs: true,
            controller_specs: true,
            request_specs: true
      generate.fixture_replacement :factory_bot, dir: "spec/factories"
    end
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

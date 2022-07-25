require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Load ENV variables from credentials.yml file
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'credentials.yml')
      YAML.load(File.open(env_file))[Rails.env].each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

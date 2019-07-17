require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AuthorsHaven
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'application.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exist?(env_file)
    end
  end
end

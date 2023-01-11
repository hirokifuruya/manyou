require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Manyoukadai1
  class Application < Rails::Application
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :rspec,
                        model_specs: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: false,
                        request_specs: false
    end
  end
end

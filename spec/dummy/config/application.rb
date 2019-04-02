require_relative 'boot'

require 'rails/all'

#require "active_storage"
#require "active_storage/engine"

Bundler.require(*Rails.groups)

require "cas_seas3_rails_responders2"
require 'byebug'

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    #config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end


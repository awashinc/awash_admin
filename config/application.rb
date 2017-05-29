require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Awash
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #
    config.assets.precompile = ['admin/statuses.js', 'admin/statuses.css',\
                              'admin/users.js', 'admin/users.css',\
                              'admin/cars.js', 'admin/cars.css',\
                              'admin/car_manufacturers.js', 'admin/car_manufacturers.css',\
                              'admin/washings.js', 'admin/washings.css',\
                              'admin/washing_comments.js', 'admin/washing_comments.css',\
                              'chats.js', 'chats.css',\
    ]
     config.assets.paths << Rails.root.join('vendor', 'assets', 'gentelella_assets')
    config.autoload_paths << Rails.root.join('lib')

    # https://github.com/rails/rails/issues/22839
    config.active_record.default_timezone = "Seoul"
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_types = [:time, :datetime]


  end
end

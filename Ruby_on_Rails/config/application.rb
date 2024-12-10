require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RubyOnRails
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
    config.active_record.schema_migrations_table_name = "schema_migrations_rb_on_rails"
  end
end

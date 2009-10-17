require 'rails/generators/named_base'
require 'rails/generators/migration'
require 'rails/generators/active_model'

module ActiveRecord
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      include Rails::Generators::Migration

      protected
        # Implement the required interface for Rails::Generators::Migration.
        #
        def next_migration_number(dirname) #:nodoc:
          if ActiveRecord::Base.timestamped_migrations
            Time.now.utc.strftime("%Y%m%d%H%M%S")
          else
            "%.3d" % (current_migration_number(dirname) + 1)
          end
        end
    end
  end
end

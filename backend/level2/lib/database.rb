module GA
  module Database
    extend ActiveSupport::Concern

    included {
      db_connect
      db_migrate
    }

    class_methods {
      def db_config
        YAML.load(ERB.new(File.read('config/database.yml')).result)
      end
      def db_connect
        ActiveRecord::Base.configurations = db_config
        ActiveRecord::Base.establish_connection(:development)
        ActiveRecord::Base.logger = Logger.new($stdout)
      end
      def db_migrate
        ActiveRecord::MigrationContext.new('db/migrate/', ActiveRecord::SchemaMigration).migrate
      end
    }
  end
end

require 'generators/nifty'

module Nifty
  module Generators
    class TranslationsGenerator < Base
      argument :layout_name, :type => :string, :default => 'application', :banner => 'layout_name'

      class_option :haml, :desc => 'Generate HAML for view, and SASS for stylesheet.', :type => :boolean

      def create_layout
        if options.haml?
          #template 'layout.html.haml', "app/views/layouts/#{file_name}.html.haml"
          #copy_file 'stylesheet.sass', "public/stylesheets/sass/#{file_name}.sass"
        else
          #template 'layout.html.erb', "app/views/layouts/#{file_name}.html.erb"
          #template "application.sass", "app/stylesheets/application.sass"
          #template "application_controller.rb", "app/controllers/application_controller.rb"
          #template "application_helper.rb", "app/helpers/application_helper.rb"
          #template "en.yml", "config/locales/en.yml"
          #template "ja.yml", "config/locales/ja.yml"
          #template "Gemfile", "Gemfile"
          #template 'generator', 'generator'
        end
        copy_file 'translations_controller.rb', 'app/controller/translations_controller.rb'
        copy_file 'locales_controller.rb', 'app/controller/locales_controller.rb'
        copy_file 'locale.rb', 'app/models/locale.rb'
        copy_file 'translation.rb', 'app/models/translation.rb'
        copy_file 'index.html.erb', 'app/views/translations/index.html.erb'
        copy_file 'i18n_backend.rb', 'config/initializers/i18n_backend.rb'
        copy_file 'cucumber/translations/delete.feature', 'features/translations/delete.feature'
        copy_file 'cucumber/translations/edit.feature', 'features/translations/edit.feature'
        copy_file 'cucumber/translations/error.feature', 'features/translations/error.feature'
        copy_file 'cucumber/translations/index.feature', 'features/translations/index.feature'
        copy_file 'cucumber/translations/new.feature', 'features/translations/new.feature'
        copy_file 'cucumber/locales/new.feature', 'features/locales/new.feature'
        copy_file 'cucumber/locales/error.feature', 'features/locales/error.feature'
        copy_file 'cucumber/locales/edit.feature', 'features/locales/edit.feature'
        copy_file 'cucumber/locales/view.feature', 'features/locales/view.feature'
        copy_file 'cucumber/redis_steps.rb', 'features/step_definitions/redis_steps.rb'
        copy_file 'rspec/translations_controller_spec.rb', 'spec/controllers/translations_controller_spec.rb'
        copy_file 'rspec/locales_controller_spec.rb', 'spec/controllers/locales_controller_spec.rb'
        copy_file '20110610051822_create_locales.rb', 'db/migrate/20110610051822_create_locales.rb'
        copy_file '20110610060750_create_translations.rb', 'db/migrate/20110610060750_create_translations.rb'
        route "    delete 'delete'"
        route "  collection do"
        route "resources :translations, :only => [:index,:create] do"
        route "resources :locales, :only => [:create,:update]"
      end

      private

      def file_name
        layout_name.underscore
      end
    end
  end
end

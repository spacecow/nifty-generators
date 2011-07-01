require 'generators/nifty'

module Nifty
  module Generators
    class ResetsGenerator < Base
      argument :layout_name, :type => :string, :default => 'application', :banner => 'layout_name'

      class_option :haml, :desc => 'Generate HAML for view, and SASS for stylesheet.', :type => :boolean

      def create_layout
        if options.haml?
        else
        end
        copy_file 'cucumber/resets/new.feature', 'features/resets/new.feature'
        copy_file 'resets_controller.rb', 'app/controllers/resets_controller.rb'
        copy_file '20110627045914_create_resets.rb', 'db/migrate/20110627045914_create_resets.rb'
        copy_file 'reset.rb', 'app/models/reset.rb'
        copy_file 'new.html.erb', 'app/views/resets/new.html.erb'
        copy_file 'reset_confirmation.text.erb', 'app/views/reset_mailer/reset_confirmation.text.erb'
        copy_file 'reset_mailer.rb', 'app/mailers/reset_mailer.rb'
        copy_file 'reset_password_controller.rb', 'app/models/reset_password_controller.rb'
        copy_file 'change_password.html.erb', 'app/views/users/change_password.html.erb'
        
        route "resources :resets, :only => [:new,:create]"
        route "# FOR USERS"
        route "    get 'change_password'"
        route "    put 'update_password'"
      end

      private

      def file_name
        layout_name.underscore
      end
    end
  end
end

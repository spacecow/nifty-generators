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
        copy_file 'resets_controller.rb', 'app/controllers/resets_controller.rb'
        route "resources :resets, :only => [:new,:create]"
      end

      private

      def file_name
        layout_name.underscore
      end
    end
  end
end

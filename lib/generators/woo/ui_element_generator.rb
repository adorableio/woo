module Woo
  module Generators
    class UiElementGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :file_name

      desc 'Create a UI Element for woo!'

      def create_ui_element
        template '_module.erb', "app/views/styleguide/ui_elements/_#{file_name}.html.haml"
      end
    end
  end
end

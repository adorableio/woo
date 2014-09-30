module Styleguide
  module Generators

    class PageGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :file_name
      argument :directory_name, default: 'pages', required: false

      desc 'Create a Page for woo!'

      def create_page
        template 'example_page.erb', "app/views/styleguide/#{directory_name}/#{file_name}.html.haml"
      end
    end

  end
end

module Woo
  module Generators
    class PageGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :file_path

      desc 'Create a Page for woo!'

      def create_page
        path_array = Pathname.new(file_path).each_filename.to_a
        if path_array.length > 2
          puts '
Rut Roh! You specified a path with more than one directory

Example:
    rails generate woo:page [DIRECTORY/]NAME

      Creates: app/views/styleguide/DIRECTORY/NAME
      If <DIRECTORY> is not specified, it will default to \'pages\''
          return
        end

        @page_path = Pathname.new(file_path).cleanpath.to_s
        template 'example_page.erb', "app/views/styleguide/#{@page_path}.html.haml"
      end
    end
  end
end

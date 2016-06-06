module Woo
  module StyleguideHelper

    BASE_PATH = "app/views/styleguide"

    def ui_elements
      ui_elements_partials = Dir.glob("#{BASE_PATH}/ui_elements/_*.html*")
      ui_elements_partials.map do |filepath|
        page_hash(filepath)
      end
    end

    def current_page(folder, page)
      filepath = Dir.glob("#{BASE_PATH}/#{folder}/#{page}.html*").first
      page_hash(filepath)
    end

    def render_contents_string(hash)
      if hash[:lang] == 'haml'
        Haml::Engine.new(hash[:contents]).render
      else
        ERB.new(hash[:contents]).result(binding).html_safe
      end
    end

    def load_notes(filepath)
      haml_frontmatter = /^-{1,3}$\n(?<notes_contents>.*)^-{1,3}$\n/m
      match = haml_frontmatter.match(File.read(filepath))
      match[:notes_contents] if match
    end

    def page_hash(filepath)
      lang     = filepath.match(/haml$/) ? 'haml' : 'erb'
      name     = File.basename(filepath)
                     .gsub(/^\_|.html.*/, '')

      {
        :name       => name,
        :filepath   => filepath,
        :markup     => {contents: File.read(filepath).sub(/^-{1,3}$\n.*^-{1,3}$\n/m, ''), lang: lang},
        :notes      => {contents: load_notes(filepath), lang: lang}
      }
    end

    def navigation_hash
      folders = folders_names
      folders.each_with_object({}) do |filepath, collection|
        collection[filepath] = folder_files(filepath)
      end
    end

    def folders_names
      Dir.glob("#{BASE_PATH}/*").map do |filepath|
        name = File.basename(filepath)
        name if File.directory?(filepath) && name != 'shared'
      end.compact
    end

    def folder_files(folder_name)
      prefix = (folder_name == 'ui_elements') ? '#' : "#{folder_name}/"

      files = Dir.glob("#{BASE_PATH}/#{folder_name}/*.html*")
      files.map do |filepath|
        name = File.basename(filepath)
                   .gsub(/^\_|.html.*/, '')

        route = "/styleguide/#{prefix}#{name}"

        {:name => name, :route => route}
      end
    end

  end
end

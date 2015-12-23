module Woo
  class Engine < ::Rails::Engine
    isolate_namespace Woo

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end

    config.woo = ActiveSupport::OrderedOptions.new
    config.woo.stylesheets = %w(woo/application application)
    config.woo.javascripts = %w(woo/application application)
    config.woo.view_contexts = []

    initializer 'precompile custom assets' do |app|
      app.config.assets.precompile += app.config.woo.stylesheets
      app.config.assets.precompile += app.config.woo.javascripts
    end
  end
end

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

    initializer 'precompile custom stylesheets' do |app|
      app.config.assets.precompile += app.config.woo.stylesheets
    end
  end
end

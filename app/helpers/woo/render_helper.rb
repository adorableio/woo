module Woo
  module RenderHelper
    DEFAULT_VIEW_CONTEXTS = [
      Haml::Helpers,
      StyleguideHelper
    ]

    module FallbackDelegationHelper
      def method_missing(name, *args, &block)
        if respond_to?(name, true)
          send(name, *args, &block)
        elsif controller.respond_to?(name, true)
          controller.send(name, *args, &block)
        else
          super(name, *args, &block)
        end
      end
    end

    def application_view_context
      view_paths = Rails.application.config.paths['app/views']

      @app_view_context ||= ActionView::Base.new(view_paths, {}, controller).tap do |context|
        view_contexts.each { |mod| context.extend(mod) }
        context.define_singleton_method(:protect_against_forgery?) { nil }
      end
    end

    def application_view_paths
      @app_view_paths ||= Rails.application.config.paths['app/views']
    end

    def engine_view_context
      @engine_view_context ||= controller.view_context.tap do |context|
        context.extend(FallbackDelegationHelper)
      end
    end

    def haml_buffer
      @haml_buffer ||= Haml::Buffer.new(nil, Haml::Options.new.for_buffer)
    end

    def render_haml_string(contents)
      Haml::Engine.new(contents).render(engine_view_context)
    rescue ActionView::MissingTemplate, NoMethodError, NameError
      Haml::Engine.new(contents).render(application_view_context)
    end

    def view_contexts
      @view_contexts ||= DEFAULT_VIEW_CONTEXTS + Rails.application.config.woo.view_contexts
    end
  end
end

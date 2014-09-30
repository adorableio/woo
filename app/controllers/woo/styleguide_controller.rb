module Woo
  class StyleguideController < ApplicationController
    include WooHelper

    # expose(:navigation) { navigation_hash() }

    def index
      @ui_elements = ui_elements
    end

    def page
      @page = current_page(params[:folder], params[:page])
    end

  end
end

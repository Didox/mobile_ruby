class WebController < ApplicationController
  layout "mobile"
  
  def index
    @page = Page.find(1)
  end
end

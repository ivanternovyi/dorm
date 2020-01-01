module Errorable
  extend ActiveSupport::Concern

  included do
    protected

    def render_422
      render file: 'public/422.html'
    end  
  end
end
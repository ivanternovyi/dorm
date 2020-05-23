module Errorable
  extend ActiveSupport::Concern

  included do
    protected

    def render_422
      render file: 'public/422.html'
    end

    def render_404
      render file: 'public/404.html'
    end
  end
end
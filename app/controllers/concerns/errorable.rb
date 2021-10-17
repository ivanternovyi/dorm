# frozen_string_literal: true

module Errorable
  extend ActiveSupport::Concern

  included do
    protected

    def render_unprocessable_entity
      render file: 'public/422.html'
    end

    def render_not_found
      render file: 'public/404.html'
    end
  end
end

# frozen_string_literal: true

class MessageBroadcastJob < ActiveJob::Base
  queue_as :action_cable

  def perform(message)
    ActionCable.server.broadcast('chat_channel', content: render_message(message))
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end

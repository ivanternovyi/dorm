class ChatsController < ApplicationController
  def index
    @messages = Message.reachable
  end
end

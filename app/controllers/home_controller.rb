class HomeController < ApplicationController
  def index
    @posts = Post.important
  end
end

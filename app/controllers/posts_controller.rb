class PostsController < ApplicationController
  before_action :find_post, except: %i[new create]

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params.merge(manager_id: current_manager.id))
    if @post.save
      redirect_to manager_path(current_manager)
    else
      render :new
    end
  end

  def update
    @post.assign_attributes(post_params)
    if @post.save
      redirect_to manager_path(current_manager)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :important)
  end
end

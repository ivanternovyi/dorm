class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]
  before_action :authenticate_manager, except: %i[index]

  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params.merge(manager_id: params[:manager_id]))
    if @post.save
      redirect_to manager_path(params[:manager_id])
    else
      render :new
    end
  end

  def update
    @post.assign_attributes(post_params)
    if @post.save
      redirect_to manager_path(params[:manager_id])
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

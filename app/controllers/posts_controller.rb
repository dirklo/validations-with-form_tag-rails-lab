class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update ]
  def show
  end

  def edit
  end

  def update
    new_post = Post.new(post_params)
    new_post.id = params[:id]
    if new_post.valid?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      @post = new_post
      render 'posts/edit'
    end 
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.permit(:title, :category, :content)
  end
end

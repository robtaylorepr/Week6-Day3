class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @id = params[:id]
    if @id
      @post = Post.find(@id)   #show the post specified
    else
      @post = Post.all.order(created_at: 'desc').first  # show the first post
    end
  end


end

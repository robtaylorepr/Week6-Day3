class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.all.order(created_at: 'desc').first
  end


end

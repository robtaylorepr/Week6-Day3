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
    @posts = Post.all.order(created_at: 'desc').where("id != #{@post.id}").limit(4)
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :root
  end

  private

  def post_params
    # {post: {user_id: , body:}}
    params.require(:post).permit(:user_id, :body, :title)
  end

end

class PostsController < ApplicationController
  before_action :require_user, except:[:index,:show]

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
    @post = current_user.posts.new(post_params)
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
    @post.destroy
    redirect_to :root
  end

  private

  def post_params
    # {chirp: {user_id: , body:}}
    params.require(:post).permit(:body)
  end

  def is_owner
    @post = current_user.posts.find_by(id: params[:id])
    unless @post && @post.user == current_user
      flash[:danger] = "That's not your post, bucky"
      redirect_to :root
    end
  end

end

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if session[:user_id] == @post.user_id
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to "/login"
    end


  end

  def create
    @post = Post.create(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if session[:user_id] == @post.user_id 
      @post.destroy
      redirect_to posts_path, status: :see_other
    else
      redirect_to "/login"
    end

  end
  private
    def post_params
      params.require(:post).permit(:title, :image)
    end
end

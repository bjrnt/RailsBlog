class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    if current_author then
      @posts = Post.all.order(created_at: :desc)
    else
      @posts = Post.where(is_public: true).order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content][0]
    @post.is_public = params[:is_public]
    @post.author_id = current_author().id
    @post.category_id = params[:category]
    if @post.save then
      redirect_to "/posts/#{@post.id}"
    else
      redirect_to '/posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(:title => params[:title], :content => params[:content][0], :is_public => !!params[:is_public], :category_id => params[:category].to_i) then
      redirect_to post_path(@post.id)
    else
      redirect_to post_edit_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

end

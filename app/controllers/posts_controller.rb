class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :does_account_exist?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(topic_id: @topic.id )
  end

  def create
    @post = Post.new(post_params)
    @post.topic = Topic.find(params[:topic_id])
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post!
    @post = Post.find(params[:id])
  end

  def post_params
    params[:post].permit(:title, :content, :topic_id, :post_id)
  end

end

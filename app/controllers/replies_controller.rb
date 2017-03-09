class RepliesController < ApplicationController
  before_action :set_reply!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :does_account_exist?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @replies = Reply.all
  end

  def show
  end

  def new
    @reply = Reply.new
  end

  def create
    # byebug
    @reply = Reply.new(reply_params)
    @reply.post = Post.find(params[:post_id])
    @reply.user = current_user

    if @reply.save
      redirect_to @reply.post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reply.update(post_params)
      redirect_to @reply
    else
      render :edit
    end
  end

  def destroy
    @reply.destroy
    redirect_to posts_path
  end

  private

  def set_reply!
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params[:reply].permit(:content)
  end
end

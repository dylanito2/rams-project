class TopicsController < ApplicationController
  before_action :set_topic!, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    byebug
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  private

  def set_topic!
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params[:topic].permit(:name)
  end


end

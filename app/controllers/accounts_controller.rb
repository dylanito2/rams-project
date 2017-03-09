class AccountsController < ApplicationController
  before_action :set_account!, only: [:show, :edit, :update]

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    @account.save
    redirect_to topics_path
  end

  def show
    if @account
      render '/accounts/show'
    else
      @account = Account.new
      render '/accounts/new'
    end
  end

  def edit
  end

  def update
    @account.update(account_params)
    redirect_to account_path
  end


  private

  def set_account!
    @account = Account.find_by(user_id: current_user.id)
  end

  def account_params
    params[:account].permit(:user_id, :username, :about_me)
  end

end

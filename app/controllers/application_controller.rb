class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def does_account_exist?
    if user_signed_in?
      @account = Account.find_by(id: current_user.id)
      if !@account
        redirect_to account_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def is_admin?
    if user_signed_in?
      unless current_user.is_admin
        redirect_to topics_path, alert: "Do not touch what does not belong to you."
      end
    else
      redirect_to new_user_session_path, alert: 'Please Log In To Access This Feature'
    end
  end

end

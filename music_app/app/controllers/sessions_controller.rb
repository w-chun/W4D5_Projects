class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:users][:email], params[:users][:password])
    if user.nil?
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user.id)
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end

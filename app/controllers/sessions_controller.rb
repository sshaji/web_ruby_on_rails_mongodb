class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find(params[:session][:username].downcase)
    if user && user.authenticate?(params[:session][:password])
      log_in user
      if params[:session][:remember] == '1'
        remember user
      end
      redirect_to root_url
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end

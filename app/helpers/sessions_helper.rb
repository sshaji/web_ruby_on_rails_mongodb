module SessionsHelper
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.username
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    cookies.delete :user_id
    cookies.delete :remember_token
    @current_user = nil
  end
end

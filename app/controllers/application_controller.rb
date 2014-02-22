class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def authenticate_user #Use this on all pages that require a user to be logged in.
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def is_signed_in?
    return @current_user.present?
  end

  def requires_signed_in
    unless @current_user.present?
      redirect_to login_path
    end
  end
end
#Dealing with all controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :user_signed_in?
  before_filter :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that the below query may return nil
    sessions = session[:user_id]
    @current_user ||= Moviegoer.find_by_id(sessions) if sessions.present?
  end

  def user_signed_in?
    !!set_current_user
  end
end

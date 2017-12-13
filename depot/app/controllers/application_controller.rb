class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  protected
    def authorize
      unless current_user
        redirect_to new_session_path, notice: "Please log in"
      end
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
end

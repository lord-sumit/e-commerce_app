class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  before_action :load_user, only: :create

  def new
    @user = User.new
  end

  def create
    if @user.password.eql? params[:user][:password]
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end

  private
    def load_user
      @user = User.find_by(email: params[:user][:email])
      redirect_to new_session_path unless @user
    end
end

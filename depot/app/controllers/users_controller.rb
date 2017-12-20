class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def edit
    debugger
    @user = User.find(params[:id])
  end

  def create
    debugger
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
        #if it is run then user_id is my previous id which is not change
        #but my session id is change due to which authorisation is not run.
      redirect_to products_path
    else
      render new_user_path
    end
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      redirect_to products_path
    else
      render edit_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end

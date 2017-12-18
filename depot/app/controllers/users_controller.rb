class UsersController < ApplicationController
  before_action :validate_admin, only: :show
  before_action :validate_super_admin, except: [:index, :show, :new, :create]
  skip_before_action :authorize, only: [:new, :create]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
        #if it is run then user_id is my previous id which is not change
        #but my session id is change due to which authorisation is not run.
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def validate_admin
      unless current_user.admin?
        redirect_to users_path, notice: "access denied only admin can see"
      end
    end

    def validate_super_admin
      unless current_user.super_admin?
        redirect_to users_path, notice: "access denied"
      end
    end
end

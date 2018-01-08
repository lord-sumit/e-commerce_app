class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
          #if it is run then user_id is my previous id which is not change
          #but my session id is change due to which authorisation is not run.

        UserMailer.welcome_email(@user).deliver_now

        format.html { redirect_to(products_path, notice: 'User was successfully created.') }
        format.json { render json: products_path, status: :created, location: products_path }
        #redirect_to products_path
      else
        #render new_user_path
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

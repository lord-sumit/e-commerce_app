class AdminController < ApplicationController
  before_action :validate_admin, only: :show
  before_action :validate_super_admin, except: [:index, :show, :new, :create]
  skip_before_action :authorize, only: [:new, :create]

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find_by(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      session[:admin_id] = @admin.id
        #if it is run then admin_id is my previous id which is not change
        #but my session id is change due to which authorisation is not run.
      redirect_to @admin
    else
      render 'new'
    end
  end

  def update
    @admin = Admin.find_by(params[:id])
    if @admin.update(admin_params)
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    admin.destroy
    redirect_to admins_path
  end

  private
    def admin_params
      params.require(:admin).permit(:email, :password)
    end

    def validate_admin
      unless current_admin.admin?
        redirect_to admins_path, notice: "access denied only admin can see"
      end
    end

    def validate_super_admin
      unless current_admin.super_admin?
        redirect_to admins_path, notice: "access denied"
      end
    end
end

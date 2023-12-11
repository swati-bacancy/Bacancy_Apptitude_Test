class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create    
    @user = User.new(user_params)
    @user.password = "123456"
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, status: :see_other
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role_ids)
  end

  def check_user
    unless current_user.has_role?(:HR)
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end   
  end
end

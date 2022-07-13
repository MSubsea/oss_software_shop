class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]

  def index
    @users = policy_scope(User)
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to users_path
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.update(user_params)

    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :role)
  end
end

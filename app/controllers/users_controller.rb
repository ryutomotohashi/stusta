class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @targets = Target.where(user_id: @user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新が成功しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

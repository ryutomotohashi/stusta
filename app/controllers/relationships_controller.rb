class RelationshipsController < ApplicationController

  #フォローする時
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  #フォローを外す時
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  #自分をフォローしているUser一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  #自分がフォローしているUser一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
end

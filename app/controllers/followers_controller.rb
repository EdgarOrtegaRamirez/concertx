class FollowersController < ApplicationController

  def new
    @follower = Follower.new

    @follower.user_id = params[:user_id]
    @follower.follower_id = current_user.id
    @user = User.find(params[:user_id])

    @follower.save
    respond_to do |format|
      format.js { render 'button' }
    end
  end

  def destroy
    @follower = Follower.where(user_id: params[:user_id], follower_id: current_user.id).first
    @user = User.find(params[:user_id])
    if @follower.destroy
      respond_to do |format|
        format.js { render 'button' }
      end
    end
  end
end

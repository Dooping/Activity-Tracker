class DashboardController < ApplicationController
  def index
    @user = current_user
    @profile = @user.profile
    @friends = current_user.friendships.where(accepted: true)
    @activities = Activity.all.where(user_id: @friends)+(Activity.all.where(user_id: current_user))
  end
end

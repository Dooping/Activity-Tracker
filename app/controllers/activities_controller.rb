class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @friends = current_user.friendships.where(accepted: true)
    @activities = Activity.all.where(user_id: @friends)+(Activity.all.where(user_id: current_user))
   # respond_with(@activities)
  end

  def show
   # respond_with(@activity)
  end

  def new
    @activity = Activity.new
    #respond_with(@activity)
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    if current_user
      @activity.user_id = current_user.id
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
    @activity.save

    # respond_with(@activity)
  end

  def update
    @activity.update(activity_params)
   # respond_with(@activity)
  end

  def destroy
    @activity.destroy
   # respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :duration, :initialTime, :place, :gpx)
    end
end

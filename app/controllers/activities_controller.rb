class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @profile = current_user.profile
    @friends = current_user.friendships.where(accepted: true)
    if params[:datee].blank?
      @activities = Activity.all.where(user_id: @friends)+(Activity.all.where(user_id: current_user))
    else
      date = Date.new(datee["year"].to_i,datee["month"].to_i,datee["day"].to_i)
      @activities = Activity.all.where('user_id like ? AND initialTime >= ? AND
        initialTime <= ?',@friends,"#{date.to_time.beginning_of_day}","#{date.to_time.beginning_of_day}")
    end
    @activities = @activities.sort_by(&:"#{:initialTime}")
    @activities = @activities.reverse
  end

  def show
    @profile = current_user.profile
   # respond_with(@activity)
  end

  def new
    @activity = Activity.new
    @profile = current_user.profile
    #respond_with(@activity)
  end

  def edit
    @profile = current_user.profile
  end

  def create
    @profile = current_user.profile
    @activity = Activity.new(activity_params)
    if current_user
      @activity.user_id = current_user.id
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end

    if @activity.save
      redirect_to activity_path(@activity.id)
    end 
    #respond_with(@activity)
  end

  def update
    @profile = current_user.profile
    @activity.update(activity_params)
    redirect_to activity_path(@activity.id)
   # respond_with(@activity)
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
   # respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :acttype, :duration,:distance, :initialTime, :place, :gpx)
    end
end

class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  def show
    @profile = current_user.profile
  end

  def new
    @profile = current_user.profile
    @sport = Sport.new
  end

  def edit
    @profile = current_user.profile
  end

  def create
    @profile = current_user.profile
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to new_activity_path
    end
  end

  def update
    @profile = current_user.profile
    @sport.update(sport_params)
  end

  def destroy
    @profile = current_user.profile
    @sport.destroy
  end

  private
    def set_sport
      @sport = Sport.find(params[:id])
    end

    def sport_params
      params.require(:sport).permit(:name)
    end
end

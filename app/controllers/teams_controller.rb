class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @profile = current_user.profile
    #@teams = Team.where('teams.leader_id == teams.profile_id')
    @teams = Team.all
  end

  def show
    @profile = current_user.profile
    @members = Team.where(name: @team.name).map(&:profile_id)
  end

  def new
    @profile = current_user.profile
    @team = Team.new
  end

  def edit
    @profile = current_user.profile
    if current_user.profile.id != @team.leader_id
      if Team.exists?(name: @team.name, profile_id:  current_user.profile.id)
        Team.where(name: @team.name, profile_id:  current_user.profile.id).destroy_all
      else
        Team.create(name: @team.name, leader_id: @team.leader_id, description: @team.description, 
          sport_id: @team.sport_id, profile_id: current_user.profile.id)
      end
      redirect_to teams_path
    end
  end

  def create
    @profile = current_user.profile
    @team = Team.new(team_params)
    @team.leader_id = current_user.profile.id
    @team.profile_id = current_user.profile.id
    @team.save
    redirect_to teams_path
  end

  def update
    @profile = current_user.profile
    if current_user.profile.id == @team.leader_id
      @team.update(team_params)
    end
      redirect_to teams_path
  end

  def destroy
    @profile = current_user.profile
    if current_user.profile.id == @team.leader_id
      @team.destroy
    end
      redirect_to teams_path
    
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :leader_id, :description, :sport_id, :profile_id)
    end
end

class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :update, :destroy, :edit]

  def index
    @invites = Friendship.where(Email1: current_user.email,accepted: false)
    @friendships = (Friendship.where(Email2: current_user.email,accepted: true).select("user_id","email1 as email","id"))+
        (Friendship.where(Email1: current_user.email,accepted: true).select("user_id2 as user_id","email2 as email","id"))
    if not params[:search].blank?
      @friendships = @friendships.where("email like ?", "%#{params[:search]}%")
    end

    #respond_with(@friendships)
  end

  def show
   # respond_with(@friendship)
  end

  def edit
    @friendship = Friendship.find(params[:id])
    @friendship.accepted = true;
    @friendship.save
  end

  def new
    @friendship = Friendship.new
    @users = User.all
    if not params[:search].blank?
      @users = User.joins(:profile).where("name like ?", "%#{params[:search]}%")
    end
  end


  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.email2 = current_user.email
    @friendship.user_id = User.where(email: @friendship.email1).first.id
    @friendship.user_id2 = current_user.id
    @friendship.accepted = false
    @friendship.save
  #  respond_with(@friendship)
  end

  def update
    @friendship.update(friendship_params)
    #respond_with(@friendship)
  end

  def destroy
    @friendship.destroy
  #  respond_with(@friendship)
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:email1)
    end
end

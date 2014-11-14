class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  def index
    @friendships = Friendship.where(Email2: current_user.email)
    if not params[:search].blank?
      #@friendships = Friendship.all
      @friendships = @friendships.where("Email1 like ?", "%#{params[:search]}%")
    end
    #respond_with(@friendships)
  end

  def show
   # respond_with(@friendship)
  end

  def new
    @friendship = Friendship.new
    #respond_with(@friendship)
  end

  def edit
  end

  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.email2 = current_user.email
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

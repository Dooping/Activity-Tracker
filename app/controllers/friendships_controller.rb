class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :update, :destroy, :edit]

  def index
    @invites = Friendship.where(Email1: current_user.email,accepted: false)
    if params[:search].blank?
    @friendships = (Friendship.where(Email2: current_user.email,accepted: true).select("user_id","email1 as email","id"))+
        (Friendship.where(Email1: current_user.email,accepted: true).select("user_id2 as user_id","email2 as email","id"))
    else
      @friendships = (Friendship.where(Email2: current_user.email,accepted: true,Email1: params[:search]).select("user_id","email1 as email","id"))+
          (Friendship.where(Email1: current_user.email,accepted: true,Email2: params[:search]).select("user_id2 as user_id","email2 as email","id"))
    end

    #respond_with(@friendships)
  end

  def show
    if not (current_user.email == @friendship.email2 || current_user.email == @friendship.email1)
      redirect_to friendships_path
    end
  end

  def edit
    @friendship = Friendship.find(params[:id])
    if current_user.email == @friendship.email1
      @friendship.accepted = true
      @friendship.save
    else
      redirect_to friendships_path
    end
  end

  def new
    @friendship = Friendship.new
    @users = User.all
    if not params[:search].blank?
      @users = User.joins(:profile).all.where("name like ?", "%#{params[:search]}%")
    end
  end


  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.email2 = current_user.email
    @friendship.user_id = User.where(email: @friendship.email1).first.id
    @friendship.user_id2 = current_user.id
    @friendship.accepted = false
    if not (@friendship.email1 == current_user.email)
      @friendship.save
      redirect_to friendship_path(@friendship.id)
    else
      redirect_to friendships_path, notice: 'You cant add yourself as a friend'
    end
  #  respond_with(@friendship)
  end

  def update
    @friendship.update(friendship_params)
    redirect_to friendships_path
  end

  def destroy
    if  (current_user.email == @friendship.email2 || current_user.email == @friendship.email1)
      @friendship.destroy
    end
    redirect_to friendships_path
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

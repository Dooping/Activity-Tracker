class WelcomeController < ApplicationController
  def index

    if !current_user.profile.present?
      redirect_to profiles_path and return
    end
    if current_user
      redirect_to activities_path and return
    end
    redirect_to new_user_session_path
  end
end

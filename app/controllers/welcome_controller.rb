class WelcomeController < ApplicationController
  def index

    if !current_user.profile.present?
      redirect_to new_profile_path and return
    end
    if user_signed_in?
      redirect_to dashboard_index_path and return
    end
    redirect_to new_user_session_path
  end
end

class WelcomeController < ApplicationController
  def index

    if current_user
      redirect_to activities_path and return
    end
    redirect_to new_user_session_path
  end
end

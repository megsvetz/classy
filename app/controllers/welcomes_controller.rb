class WelcomesController < ApplicationController
  def index
  end

  def listings
    @user = current_user
    unless @user
      render(text: "User not found.", status: :not_found)
    end
  end

end


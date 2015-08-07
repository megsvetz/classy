class WelcomesController < ApplicationController
  before_action :authenticate_user!, only: [:listings]
  def index
  end

  def listings
    @user = current_user
    unless @user
      render(text: "User not found.", status: :not_found)
    end
  end

end


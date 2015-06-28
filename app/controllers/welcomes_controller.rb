class WelcomesController < ApplicationController
  def index
  end

  def listings
    @user = User.find_by(id: params[:id])
    unless @user
      render(text: "User not found.", status: :not_found)
    end
  end

end


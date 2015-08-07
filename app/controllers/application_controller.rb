class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def application
    @user = current_user
    unless @user
      render(text: "User not found.", status: :not_found)
    end
  end
end

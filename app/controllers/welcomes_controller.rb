class WelcomesController < ApplicationController
  def welcome
    redirect_to @user.pages_path if logged_in?
  end

  def about
  end
end

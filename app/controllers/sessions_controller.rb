class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:success] = "successfully logged in"
    redirect_to new_page_path
  else
    flash.now[:danger] = "Something is wrong with your login information"
    render 'new'
  end
end

def destroy
  session[:user_id] = nil
  flash[:success] = "You hav successfully logged out "
  redirect_to root_path
end

end

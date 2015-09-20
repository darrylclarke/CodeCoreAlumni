class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email params[:email]

    if @user && @user.authenticate(params[:password])

      session[:user_id] = @user.id
      if admin?
        redirect_to admin_index_path, notice: "Welcome back, master."
      else
        redirect_to root_path, notice: "Signed in successfully"
      end
    else
      flash[:alert] = "Wrong crenditials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out"
  end
end

class PasswordResetsController < ApplicationController

  def create
  	 if user = User.find_by(email: params[:email])
  		  user.generate_password_reset_token!
  	    Notify.reset_password(user).deliver_now
  	    redirect_to new_session_path, success: "Password reset sent"
  	else
  		  redirect_to new_password_reset_path, notice: "Email not found"
    end
  end

  def edit
	   if @user = User.find_by(password_reset_token: params[:id])

	   else
	      render file: ‘public/404.html’, ststus: :not_found
     end
  end

  def update
	    @user = User.find_by(password_reset_token: params[:id])
	 if @user && @user.update_attributes(user_params)
		  @user.password_reset_token = nil
			session[:user_id] = @user.id
		  redirect_to root_path, notice: "Password Changed!  😊 "
   else
	    flash[:alert] = "Reset token can't be verified  😕 "
   end
  end

  private

  def user_params
	   params.require(:user).permit(:password, :password_confirmation)
  end


end

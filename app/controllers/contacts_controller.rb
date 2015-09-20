class ContactsController < ApplicationController

  def new
    # @user_id = params[:user_id]
    @user    = @profile.user
    @contact = Contact.new
  end


  def create
    user = User.find params[:user_id]
    # user  = @profile.user
    title = params[:contact][:title]
    email = params[:contact][:email]
    body  = params[:contact][:body]
    ContactsMailer.notify_profile_owner(user, title, email, body).deliver_now
    redirect_to root_path
  end


  def contact_params
    params.require(:education).permit(:degree, :institution, :desc, :year)
  end
end

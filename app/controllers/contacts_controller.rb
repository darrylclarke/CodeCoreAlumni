class ContactsController < ApplicationController

  def new
    # @user_id = params[:user_id]
    @user    = @profile.user
    @contact = Contact.new
  end


  def create
    user = User.find params[:user_id]
    title = params[:contact][:title]
    email = params[:contact][:email]
    body  = params[:contact][:body]
    @contact = Contact.new contact_params
    @contact.user_id = user.id
    @contact.save
    ContactsMailer.notify_profile_owner(user, title, email, body).deliver_now
    redirect_to root_path
  end


  def contact_params
    params.require(:contact).permit(:title, :email, :body)
  end
end

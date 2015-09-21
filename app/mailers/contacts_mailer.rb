class ContactsMailer < ApplicationMailer

  def notify_profile_owner(user, title, email, body)
    @user = user
    @email = email
    @body  = body
    # mail(to: user.email, subject: "#{title}")
    @send_to = @user.email

    mail(to: @send_to, subject: "#{title}")
  end
end

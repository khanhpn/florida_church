class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def contact_email
    @sender = "stjohnevangelistbr@gmail.com"
    @subject = params[:subject]
    @content = params[:content]
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @phone = params[:phone]
    @email = params[:email]

    mail(to: @sender, subject: @subject)
  end
end

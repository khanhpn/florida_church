class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def contact_email
    @email = "stjohnbr1992@gmail.com"
    @subject = params[:subject]
    @content = params[:content]
    @first_name = params[:first_name]
    @last_name = params[:last_name]

    mail(to: @email, subject: @subject)
  end
end

class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def contact_email
    @email = params[:email]
    @subject = params[:subject]
    @content = params[:content]
    @first_name = params[:first_name]
    @last_name = params[:last_name]

    mail(to: @email, subject: @subject)
    redirect_to root_path
  end
end

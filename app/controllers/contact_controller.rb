class ContactController < ApplicationController
  def index
  end

  def send_contact
    return if params[:email].blank? || params[:subject].blank? || params[:content].blank?
    ContactMailer.with(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      subject: params[:subject],
      phone: params[:phone],
      content: params[:content]
    ).contact_email.deliver_later
  end
end

class ContactController < ApplicationController
  def index
    @google_map = Geography.last
  end

  def send_contact
    return if params[:subject].blank? || params[:content].blank?
    ContactMailer.with(
      first_name: params[:first_name],
      last_name: params[:last_name],
      subject: params[:subject],
      phone: params[:phone],
      content: params[:content],
      email: params[:email]
    ).contact_email.deliver_later

    redirect_to root_path
  end
end

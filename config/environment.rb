# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
# ActionMailer::Base.smtp_settings = {
#   :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
#   :password => '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', # This is the secret sendgrid API key which was issued during API key creation
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }

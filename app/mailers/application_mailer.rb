class ApplicationMailer < ActionMailer::Base
  default from: "<Site Admin> #{ENV['GMAIL_USERNAME']}"
  layout 'mailer'
end

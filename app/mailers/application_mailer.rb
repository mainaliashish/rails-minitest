class ApplicationMailer < ActionMailer::Base
  default from: 'App Admin <rails-app@admin.com>'
  layout 'mailer'
end


Rails.application.configure do
  config.action_mailer.perform_deliveries = true
  # Config for gmail account
  config.action_mailer.delivery_method = :smtp  
  config.action_mailer.default_url_options = { :host => 'localhost', port: '3000' }
  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: '587',
    domain: 'railsapp.com',
    authentication: "plain",
    user_name: ENV['GMAIL_USERNAME'],
    password: ENV['GMAIL_PASSWORD'],
    enable_starttls_auto: true,
  }
end
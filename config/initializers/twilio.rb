Twilio.configure do |config|
  config.account_sid = ENV['twilio_account']
  config.auth_token = ENV['twilio_token']
end

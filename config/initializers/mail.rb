# encoding: UTF-8
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.mandrillapp.com',
  :port           => '587',
  :authentication => :login,
  :enable_starttls_auto => true,
  :user_name      => ENV['MANDRILL_USERNAME'],
  :password       => ENV['MANDRILL_APIKEY'],
  :domain         => 'mandrillapp.com'
}
ActionMailer::Base.delivery_method ||= :smtp
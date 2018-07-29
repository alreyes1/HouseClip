source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1', '>= 5.1.6'
ruby '2.5.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise'
gem 'toastr-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'paperclip'
gem 'aws-sdk-s3'
gem 'geocoder', '~> 1.4', '>= 1.4.3'
gem 'jquery-ui-rails'

gem 'private_pub'
gem 'thin'
gem 'ransack'

#--- gems for sms, stripe and calendar and revenue chart features ---
gem 'twilio-ruby', '~> 4.11'
gem 'fullcalendar-rails', '~> 3.4.0'
gem 'momentjs-rails', '~> 2.17.1'

gem 'stripe', '~> 3.0.0'
gem 'rails-assets-card', source: 'https://rails-assets.org'

gem 'omniauth-stripe-connect', '~> 2.10.0'

gem 'chartkick', '~> 2.2.4'
gem 'redis', '~> 3.3'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

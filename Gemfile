source "https://rubygems.org"

ruby "2.2.3"

gem "bootstrap-sass"
gem "clearance"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "pg", "~> 0.18"
gem "puma"
gem "rails", "4.2.2"
gem "sass-rails", "~> 5.0"
gem "scenic"
gem "skylight"
gem "tzinfo"
gem "tzinfo-data"
gem "uglifier", ">= 1.3.0"

group :production do
  gem "rails_12factor"
end

group :development, :test do
  gem "bundler-audit", require: false
  gem "byebug"
  gem "chronic"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "rspec-rails", "~> 3.2"
  gem "web-console", "~> 2.0"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "shoulda-matchers"
end

source "https://rubygems.org"

ruby "2.2.1"

gem "active_model_serializers", "~> 0.8.3"
gem "newrelic_rpm"
gem "pg", "~> 0.18"
gem "puma"
gem "rails", "~> 4.2.0"
gem "rails-api", "~> 0.4.0"

group :production do
  gem "rails_12factor"
end

group :development, :test do
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.2"
end

group :test do
  gem "database_cleaner"
  gem "shoulda-matchers"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

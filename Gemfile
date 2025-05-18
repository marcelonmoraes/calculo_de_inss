source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # RSpec testing framework [https://github.com/rspec/rspec-rails]
  gem "rspec-rails", "~> 8.0.0"

  # fixtures replacement with a straightforward definition syntax [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails"

  # Faker is a library for generating fake data [https://github.com/faker-ruby/faker]
  gem "faker"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Letter Opener is a Rails gem that allows you to preview emails in the browser [https://github.com/ryanb/letter_opener]
  gem "letter_opener_web", "~> 3.0"
end

group :test do
  # Shoulda Matchers is a library for testing Rails models with RSpec [https://matchers.shoulda.io/]
  gem "shoulda-matchers", "~> 6.0"

  # Simplecov is a code coverage for Ruby [https://github.com/simplecov-ruby/simplecov]
  gem "simplecov", require: false

  # Set of gems containing strategies for cleaning your database in Ruby [https://github.com/DatabaseCleaner/database_cleaner]
  gem "database_cleaner-active_record", "~> 2.2"
end

# Devise is a flexible authentication solution for Rails based on Warden [https://github.com/heartcombo/devise]
gem "devise", "~> 4.9"

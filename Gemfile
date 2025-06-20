source "https://rubygems.org"

# Core
gem "rails", "~> 8.0.2"
gem "puma", ">= 5.0"
gem "pg", "~> 1.1"
gem "importmap-rails"
gem "propshaft"
gem "jbuilder"

# Hotwire
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 4.2.3"

# Authentication
gem "devise"
gem "omniauth"

# Background Jobs
gem "solid_queue"
# ⚠️ Removed solid_cache since you are using Redis for cache
# ⚠️ Removed solid_cable unless you are using ActionCable with DB-backed adapter

# Redis
gem "redis", "~> 4.0"

# Caching (used in production.rb with Redis)
# Already handled via config.cache_store = :redis_cache_store

# Sidekiq (optional if using solid_queue instead)
# Comment out unless you're actively using Sidekiq
# gem "sidekiq"

# File upload
gem "image_processing"
gem 'aws-sdk-s3', require: false

# Forms
gem "simple_form"

# Charts
gem "chartkick"
gem "groupdate"

# Deploy/Infra (optional)
gem "kamal", require: false
gem "thruster", require: false

# Performance
gem "bootsnap", require: false

# Windows compatibility
gem "tzinfo-data", platforms: %i[windows jruby]

# Env config
gem "dotenv-rails", groups: [:development, :test]

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

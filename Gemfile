source "http://rubygems.org"

# Rails so we can extend it
gem 'rails', '3.1.0.rc4'

gem "sprockets"

if RUBY_VERSION < '1.9'
  gem "ruby-debug", ">= 0.10.3"
end

group :development, :test do
  # Activerecord was complaining about it not having a database gem
  gem "sqlite3-ruby", "1.3.3"

  # Pretty printed test output
  gem "turn", :require => false

  # Debuggin
  gem "ruby-debug19", :require => false
  gem "ruby-prof", :require => false

  # Autotest
  gem "autotest-rails", :require => false
  gem "autotest-growl", :require => false
  gem "autotest-fsevent", :require => false
end
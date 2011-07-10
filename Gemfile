source "http://rubygems.org"

# Rails so we can extend it
gem "rails", "3.1.0.rc4"

gem "thor", "~> 0.14"

gem "sprockets"

if RUBY_VERSION < "1.9"
  gem "ruby-debug", ">= 0.10.3"
end

group :development, :test do
  # Using jeweler because it's just so easy
  gem "jeweler"

  # Activerecord was complaining about it not having a database gem
  gem "sqlite3-ruby"

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
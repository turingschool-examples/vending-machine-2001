source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"

group :development, :test do
  gem "database_cleaner"
  gem "rspec-rails"
  gem "capybara"
  gem "launchy"
  gem "simplecov"
  gem "pry"
  gem "nyan-cat-formatter"
  gem "shoulda-matchers"
  gem "orderly"
  gem "rails-erd"
  gem "awesome_print", :require => "ap"
  gem "hirb"
  gem "faker"
  gem "factory_bot_rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.5'
gem 'sdoc', '~> 0.4.0', group: :doc


group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.6', '>= 3.6.1'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.8'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
end

gem 'devise', '~> 4.3'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'chartkick'
gem 'groupdate'
gem 'momentjs-rails'
gem 'bootstrap-daterangepicker-rails'

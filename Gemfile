source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.5.0'
gem 'rails', '~> 6.1.7', '>= 6.1.7.4'
gem 'puma', '~> 4.3', '>= 4.3.12'
gem 'sass-rails', '~> 5.0', '>= 5.0.8'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 5.0', '>= 5.0.0'
gem 'jbuilder', '~> 2.7', '>= 2.7.0'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.18', '>= 2.18.0'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 4.0.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.1'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "bootstrap", ">= 4.3.1"
gem 'devise', '>= 4.7.0'
gem 'high_voltage'
gem 'jquery-rails', '>= 4.3.4'
gem 'mysql2', '~> 0.3.18'
group :development do
  gem 'better_errors', '>= 2.8.0'
  gem 'hub', :require=>nil
  gem 'rails_layout'
end

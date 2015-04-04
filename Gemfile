source 'https://rubygems.org'

ruby '2.1.5'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record

gem 'puma', '2.11.1'

group :development, :test do
	gem 'sqlite3'
end	

group :production do
	gem 'pg', '0.18.1'
	gem 'rails_12factor' , '0.0.3'
	gem 'therubyracer-heroku', :platform => :ruby
end


gem 'devise' , '3.4.1'
#gem 'omniauth', '1.2.2'
#gem 'omniauth-twitter', '1.1.0'
#gem 'omniauth-facebook', '2.0.1'
#gem 'omniauth-linkedin', '0.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '5.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.0.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.12'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.1', group: :doc

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '1.2015.2' , platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

# Use sqlite3 as the database for Active Record
group :development do
	gem 'sqlite3'
end

group :development, :test do
  	gem "factory_girl_rails"
  	gem 'ffaker'
  	gem "pry-rails"
  	gem 'pry-nav'
end

group :test do
	gem 'rspec-rails', "~> 2.14"
	gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
end

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

#Api gems
gem 'active_model_serializers'
gem 'devise'
gem 'pg'

gem 'sabisu_rails', github: "IcaliaLabs/sabisu-rails"
gem 'furatto', github: "IcaliaLabs/furatto-rails"
gem 'compass-rails', '~> 2.0.4'
gem 'font-awesome-rails'
gem 'simple_form'
gem 'jbuilder', '~> 2.0'

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', require: false
end

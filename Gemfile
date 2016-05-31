source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

gem 'bootstrap', '~> 4.0.0.alpha3'

# Fixes ajax upload
gem 'rails_admin', :github => 'sferik/rails_admin', :ref => 'c860b2f'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'allport', :git => "git://github.com/baphomet-berlin/allport.git", :branch => "feature/rails_admin"

source 'https://rails-assets.org' do
  gem 'rails-assets-tether'
  gem 'rails-assets-scrollmagic'
  gem 'rails-assets-gsap'
  gem 'rails-assets-holderjs'
  gem 'rails-assets-keymaster'
  gem 'rails-assets-imagesloaded'
  gem 'rails-assets-isotope-fit-columns'
  gem 'rails-assets-backbone'
  gem 'rails-assets-underscore'
end
gem 'isotope-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'sqlite3'
  gem 'guard-rails', require: false

end

gem 'devise', '3.5.6'
gem 'cancancan', '1.13.1'
gem 'paperclip', :git=> 'https://github.com/thoughtbot/paperclip', :ref => '523bd46c768226893f23889079a7aa9c73b57d68'
gem 'aws-sdk', '2.2.27'
gem 'rails_admin_tag_list', '0.2.0'
gem 'acts-as-taggable-on', '3.5.0'

gem 'ruby-units', '2.0.0'
gem 'countries', :require => 'countries/global'

gem 'redcarpet', '3.3.4'
gem 'publishable', '1.0.4'
gem 'lightbox-bootstrap-rails'

gem 'compass', '1.0.3'
gem 'compass-rails', '3.0.2'
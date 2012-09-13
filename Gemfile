source 'https://rubygems.org'

gem "alchemy_cms", '2.3.0'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',      '~> 3.2.3'
  gem 'coffee-rails',    '~> 3.2.1'
  gem 'compass-rails',   '~> 1.0.3'
  gem 'zurb-foundation', '~> 3.0.9'
  gem 'slim-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "debugger"
  gem "capistrano"
end

group :production do
  gem 'therubyracer'
  gem 'newrelic_rpm'
end

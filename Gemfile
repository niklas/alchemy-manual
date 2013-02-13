source 'https://rubygems.org'

gem 'rails', '~> 3.2.12'
gem 'alchemy_cms', github: 'magiclabs/alchemy_cms', branch: '2.5-stable'
gem 'mysql2'
gem 'slim-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',      '~> 3.2.3'
  gem 'coffee-rails',    '~> 3.2.1'
  gem 'compass-rails',   '~> 1.0.3'
  gem 'zurb-foundation', '~> 3.0.9'
  gem 'uglifier',        '>= 1.0.3'
end

group :development do
  gem 'debugger'
  gem 'capistrano'
  gem 'capistrano-maintenance'
end

group :production do
  gem 'therubyracer'
  gem 'newrelic_rpm'
end

if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'http://rubygems.org'

gem "rails", "~> 3.2.12"

gem 'simple_form'
gem 'jquery-rails'
gem 'rails_autolink'
gem 'ey_config'

gem 'rumm', '0.0.6'
gem "knife-solo", ">= 0.3.0pre3"
gem "berkshelf"

gem 'capistrano'
gem 'capistrano-rbenv'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'mysql2'
  gem 'unicorn'
  gem 'puma'
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'jruby-openssl'
  gem 'jdbc-mysql', :require => false
  gem 'jdbc-sqlite3', :require => false
  #gem 'jdbc-postgres', :require => false
  gem 'trinidad'
  gem 'thor'
end

group :rbx do
  gem 'puma'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do

end

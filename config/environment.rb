# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'warden'
  config.gem 'devise', :version => '1.0.6'
  config.gem 'haml'
  config.gem 'paperclip'
  config.gem 'twitter'
  config.gem 'ruby-mp3info', :lib => 'mp3info'
  config.gem 'jammit'
  config.gem 'hoptoad_notifier'
  config.gem 'newrelic_rpm'
  config.gem 'redgreen'

  config.time_zone = 'Amsterdam'

end

# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'angular_rails_csrf/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'angular_rails_csrf'
  s.version     = AngularRailsCsrf::VERSION
  s.authors     = ['James Sanders', 'Ilya Krukowski']
  s.email       = ['sanderjd@gmail.com', 'golosizpru@gmail.com']
  s.homepage    = 'https://github.com/jsanders/angular_rails_csrf'
  s.summary     = 'Support for AngularJS $http service style CSRF protection in Rails'
  s.description = 'AngularJS style CSRF protection for Rails'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.required_ruby_version = '>= 3.0'

  s.add_dependency 'railties', '>= 3', '< 8'

  s.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end

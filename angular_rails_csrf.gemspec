# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'angular_rails_csrf/version'

Gem::Specification.new do |s|
  s.name        = 'angular_rails_csrf'
  s.version     = AngularRailsCsrf::VERSION
  s.authors     = ['James Sanders', 'Ilya Krukowski']
  s.email       = ['sanderjd@gmail.com', 'golosizpru@gmail.com']
  s.homepage    = 'https://github.com/jsanders/angular_rails_csrf'
  s.summary     = 'Support for AngularJS $http service style CSRF protection in Rails'
  s.description = 'AngularJS style CSRF protection for Rails'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'LICENSE.md', 'Rakefile', 'README.md', 'CHANGELOG.md']

  s.required_ruby_version = '>= 3.2'

  s.add_dependency 'railties', '>= 3', '< 9'

  s.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end

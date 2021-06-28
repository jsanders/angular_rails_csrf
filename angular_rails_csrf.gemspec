# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'angular_rails_csrf/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'angular_rails_csrf'
  s.version     = AngularRailsCsrf::VERSION
  s.authors     = ['James Sanders', 'Ilya Bodrov-Krukowski']
  s.email       = ['sanderjd@gmail.com', 'golosizpru@gmail.com']
  s.homepage    = 'https://github.com/jsanders/angular_rails_csrf'
  s.summary     = 'Support for AngularJS $http service style CSRF protection in Rails'
  s.description = 'AngularJS style CSRF protection for Rails'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.required_ruby_version = '>= 2.6.0'

  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'test-unit', '~> 3.2'
  if ENV['TEST_RAILS_VERSION'].nil?
    s.add_development_dependency 'rails', '6.1.4'
  else
    s.add_development_dependency 'rails', ENV['TEST_RAILS_VERSION'].to_s
  end

  s.add_runtime_dependency 'railties', '>= 3', '< 7'

  s.add_development_dependency 'codecov',                   '~> 0.2'
  s.add_development_dependency 'rubocop',                   '~> 1.0'
  s.add_development_dependency 'rubocop-performance',       '~> 1.5'
  s.add_development_dependency 'simplecov',                 '~> 0.16'
end

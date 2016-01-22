$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "angular_rails_csrf/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "angular_rails_csrf"
  s.version     = AngularRailsCsrf::VERSION
  s.authors     = ['James Sanders']
  s.email       = ['sanderjd@gmail.com']
  s.homepage    = 'https://github.com/jsanders/angular_rails_csrf'
  s.summary     = 'Support for AngularJS $http service style CSRF protection in Rails'
  s.description = 'AngularJS style CSRF protection for Rails'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rake', '~> 10.1.0'
  s.add_development_dependency 'test-unit', '~> 3.1.1'
  unless ENV['TEST_RAILS_VERSION'].nil?
    s.add_development_dependency 'rails', ENV['TEST_RAILS_VERSION'].to_s
  end

  s.add_runtime_dependency 'rails', '>= 3', '< 5.1'
end

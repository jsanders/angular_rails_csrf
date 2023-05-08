# frozen_string_literal: true

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require 'simplecov'
SimpleCov.start do
  add_filter 'test/'
  add_filter '.github/'
end

require File.expand_path('dummy/config/environment.rb', __dir__)
require 'rails/test_help'

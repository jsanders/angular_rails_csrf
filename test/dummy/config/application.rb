# frozen_string_literal: true

require File.expand_path('boot', __dir__)

require 'action_controller/railtie'

Bundler.require(:default, Rails.env)
require 'angular_rails_csrf'

module Dummy
  class Application < Rails::Application
    config.secret_key_base = '5e6b6d2bd7bf26d02679ac958b520adf41b211eb0b8f33742abc5' \
                             '437711d0ad314baf13efc0d35d7568d2e469668a7021cf5e945c667bd16507777aedb770f83'
    config.eager_load = false # You get yelled at if you don't set this
    config.active_support.test_order = :random
    config.load_defaults 8.0
  end
end

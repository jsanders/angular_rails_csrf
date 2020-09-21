# frozen_string_literal: true

module AngularRailsCsrf
  module Concern
    extend ActiveSupport::Concern

    included do
      after_action :set_xsrf_token_cookie
    end

    def set_xsrf_token_cookie
      return unless defined?(protect_against_forgery?) && protect_against_forgery? && !respond_to?(:__exclude_xsrf_token_cookie?)

      config = Rails.application.config

      secure = option_from config, :angular_rails_csrf_secure
      same_site = option_from config, :angular_rails_csrf_same_site, :lax

      cookie_options = {
        value: form_authenticity_token,
        domain: option_from(config, :angular_rails_csrf_domain),
        same_site: same_site,
        httponly: option_from(config, :angular_rails_csrf_httponly, false),
        secure: same_site.eql?(:none) || secure
      }

      cookie_name = option_from(config,
                                :angular_rails_csrf_cookie_name,
                                'XSRF-TOKEN')
      cookies[cookie_name] = cookie_options
    end

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end

    private

    # Fetches the given option from config
    # If the option is not set, return a default value
    def option_from(config, option, default = nil)
      config.respond_to?(option) ? config.send(option) : default
    end

    module ClassMethods
      def exclude_xsrf_token_cookie
        class_eval do
          def __exclude_xsrf_token_cookie?
            true
          end
        end
      end
    end
  end
end

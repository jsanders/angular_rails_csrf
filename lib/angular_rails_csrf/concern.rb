# frozen_string_literal: true

module AngularRailsCsrf
  module Concern
    extend ActiveSupport::Concern

    included do
      after_action :set_xsrf_token_cookie
    end

    def set_xsrf_token_cookie
      return unless protect_against_forgery? && !respond_to?(:__exclude_xsrf_token_cookie?)

      config = Rails.application.config

      cookie_options = {
        value: form_authenticity_token,
        domain: config.respond_to?(:angular_rails_csrf_domain) ? config.angular_rails_csrf_domain : nil,
        same_site: config.respond_to?(:angular_rails_csrf_same_site) ? config.angular_rails_csrf_same_site : :lax
      }
      cookie_options[:secure] = config.angular_rails_csrf_secure if config.respond_to?(:angular_rails_csrf_secure)

      cookie_name = config.respond_to?(:angular_rails_csrf_cookie_name) ? config.angular_rails_csrf_cookie_name : 'XSRF-TOKEN'
      cookies[cookie_name] = cookie_options
    end

    def verified_request?
      if respond_to?(:valid_authenticity_token?, true)
        super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
      else
        super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
      end
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

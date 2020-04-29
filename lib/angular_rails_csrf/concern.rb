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

      same_site = same_site_from config
      secure = secure_from config

      cookie_options = {
        value: form_authenticity_token,
        domain: domain_from(config),
        same_site: same_site,
        secure: same_site.eql?(:none) || secure
      }

      cookie_name = cookie_name_from config
      cookies[cookie_name] = cookie_options
    end

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end

    private

    def same_site_from(config)
      config.respond_to?(:angular_rails_csrf_same_site) ? config.angular_rails_csrf_same_site : :lax
    end

    def secure_from(config)
      config.angular_rails_csrf_secure if config.respond_to?(:angular_rails_csrf_secure)
    end

    def domain_from(config)
      config.respond_to?(:angular_rails_csrf_domain) ? config.angular_rails_csrf_domain : nil
    end

    def cookie_name_from(config)
      config.respond_to?(:angular_rails_csrf_cookie_name) ? config.angular_rails_csrf_cookie_name : 'XSRF-TOKEN'
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

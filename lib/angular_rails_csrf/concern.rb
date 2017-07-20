module AngularRailsCsrf
  module Concern
    extend ActiveSupport::Concern

    included do
      if Rails::VERSION::MAJOR < 4
        after_filter :set_xsrf_token_cookie
      else
        after_action :set_xsrf_token_cookie
      end
    end

    def set_xsrf_token_cookie
      if protect_against_forgery? && !respond_to?(:__exclude_xsrf_token_cookie?)
        cookies['XSRF-TOKEN'] = form_authenticity_token
      end
    end

    def verified_request?
      downcase_headers = request.headers.to_a.map { |v| [v.first.downcase, v.last] }.to_h

      if respond_to?(:valid_authenticity_token?, true)
        super || valid_authenticity_token?(session, downcase_headers['x-xsrf-token'])
      else
        super || form_authenticity_token == downcase_headers['x-xsrf-token']
      end
    end

    module ClassMethods
      def exclude_xsrf_token_cookie
        self.class_eval do
          def __exclude_xsrf_token_cookie?
            true
          end
        end
      end
    end
  end
end

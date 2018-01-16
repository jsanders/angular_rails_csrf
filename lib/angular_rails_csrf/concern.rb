module AngularRailsCsrf
  module Concern
    extend ActiveSupport::Concern

    included do
      after_action :set_xsrf_token_cookie
    end

    def set_xsrf_token_cookie
      if protect_against_forgery? && !respond_to?(:__exclude_xsrf_token_cookie?)
        cookies['XSRF-TOKEN'] = form_authenticity_token
      end
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
        self.class_eval do
          def __exclude_xsrf_token_cookie?
            true
          end
        end
      end
    end
  end
end

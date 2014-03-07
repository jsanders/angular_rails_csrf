module AngularRailsCsrf
  module Concern
    extend ActiveSupport::Concern

    included do
      after_filter :set_xsrf_token_cookie
    end

    def set_xsrf_token_cookie
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    end

    def verified_request?
      super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    end
  end
end

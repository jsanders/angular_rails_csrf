class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  if Rails::VERSION::MAJOR < 4
    # Mimic `protect_from_forgery with: :exception` for older Rails versions.
    def handle_unverified_request
      raise ActionController::InvalidAuthenticityToken
    end
  end

  def index;  head :ok; end
  def create; head :ok; end
end

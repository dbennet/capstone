require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html
  respond_to :json

	include ActionController::ImplicitRender
	include ActionController::MimeResponds
end

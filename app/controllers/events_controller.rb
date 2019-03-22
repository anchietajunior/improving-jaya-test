class EventsController < ApplicationController

  before_action :authenticate

  def new
    Events::EventCreatorService.call(@request_body) if @authentication.success?
    head :ok
  end

  def list
    result = Events::EventSearchService.call(params)
    @events = result.value
    render json: @events, status: result.success? ? :ok : :no_content
  end

  private

  def authenticate
    request.body.rewind
    @request_body = request.body.read
    @authentication = Authentication::AuthenticationService.call(request.headers['X-Hub-Signature'], @request_body)
  end
end

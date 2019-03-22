class EventsController < ApplicationController

  before_action :webhook_authenticate, only: [:new]
  before_action :authenticate_user, only: [:list]

  def new
    Events::EventCreatorService.call(@request_body) if @webhook_authentication.success?
    head :ok
  end

  def list
    p request.headers['login']
    result = Events::EventSearchService.call(params)
    @events = result.value
    render json: @events, status: result.success? ? :ok : :no_content
  end

  private

  def webhook_authenticate
    request.body.rewind
    @request_body = request.body.read
    @webhook_authentication = Authentication::AuthenticationService.call(request.headers['X-Hub-Signature'], @request_body)
  end

  def authenticate_user
    @basic_auth
  end
end

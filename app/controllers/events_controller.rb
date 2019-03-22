class EventsController < ApplicationController

  before_action :webhook_authenticate, only: [:new]
  before_action :authenticate_user, only: [:list]

  def new
    request.body.rewind
    request.body.read
    Events::EventCreatorService.call(request.body.read) if @webhook_authentication.success?
    head :ok
  end

  def list
    result = Events::EventSearchService.call(params)
    @events = result.value
    if @basic_auth.success?
      render json: @events
    else
      render json: { "message": "Not authorized"}
    end
  end

  private

  def webhook_authenticate
    @webhook_authentication = Authentication::AuthenticationService.call(request.headers['X-Hub-Signature'], request.body.read)
  end

  def authenticate_user
    @basic_auth = Authentication::BasicAuthService.call(request.headers)
  end
end

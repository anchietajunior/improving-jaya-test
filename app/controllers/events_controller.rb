class EventsController < ApplicationController

  before_action :authenticate

  def new
    p @result
    head :ok
  end

  def list
    @events = Event.all
    p params[:type]
    p params[:id]
    render json: @events
  end

  private

  def authenticate
    @result = Authentication::AuthenticationService.call(request.headers['X-Hub-Signature'], request.body.read)
  end
end

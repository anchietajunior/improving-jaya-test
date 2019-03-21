class ReceiveController < ApplicationController
  def new
    result = Authentication::AuthenticationService.call(request.headers['X-Hub-Signature'], request.body.read)
    head :ok
  end
end

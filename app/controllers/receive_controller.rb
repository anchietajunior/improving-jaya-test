class ReceiveController < ApplicationController
  def new
    p "HEADERS: #{request.headers['X-Hub-Signature']}"
    request.body.rewind
    payload_body = request.body.read
    p "PAYLOAD: =================================\n"
    p payload_body
    result = Authentication::AuthenticationService.call(request.headers['X-Hub-Signature'], request.body.read)
    p "RESULT: #{result}"
    head :ok
  end
end

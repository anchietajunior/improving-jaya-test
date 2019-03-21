class ReceiveController < ApplicationController
  def new
    p "HEADERS: #{request.headers['X-Hub-Signature']}"
    p "PARAMS: #{params}"
    head :ok
  end
end

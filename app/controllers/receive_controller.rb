class ReceiveController < ApplicationController
  def new
    p "PARAMS: #{params}"
    head :ok
  end
end

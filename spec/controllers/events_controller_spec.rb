require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "GET #list" do
    it "has a not authorized message" do
      get "issues/1000/events"
      p response
    end
  end

end

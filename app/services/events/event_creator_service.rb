module Events
  class EventCreatorService < ApplicationService
    def initialize(request)
      @request = JSON.parse(request)
    end

    def call
      Result.new(true, nil, create_event!)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :request

    def create_event!
      Event.create! event_params
    end

    def action
      request.first.last
    end

    def event_type
      request.keys[1]
    end

    def number
      request["#{event_type}"]["number"]
    end

    def event_params
      {}.tap do |hash|
        hash[:event_type] = event_type
        hash[:number] = number
        hash[:action] = action
      end
    end
  end
end

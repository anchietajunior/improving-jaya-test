module Events
  class EventCreatorService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      Result.new(true, nil, create_event!)
    end

    private

    attr_accessor :params

    def create_event!
      Event.create!(issue)
    end

    def event_type

    end

    def issue_params
      {}.tap do |hash|
        hash[:id]  = params["issue"]["number"]
        hash[:url] = params["issue"]["url"]
      end
    end

    def event_params
      {}.tap do |hash|
        hash[:issue_id] = issue.id
        hash[:action] =
      end
    end
  end
end

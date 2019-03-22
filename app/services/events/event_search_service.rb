module Events
  class EventSearchService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      Result.new(true, nil, events)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :params

    def events
      Event.where(event_type: event_type, number: params[:number])
    end

    def event_type
      @event_type ||= params[:type].singularize
    end
  end
end

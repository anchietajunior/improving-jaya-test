module Events
  class EventCreatorService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      Result.new(true, nil, "EVENT")
    end

    private

    attr_accessor :params
  end
end

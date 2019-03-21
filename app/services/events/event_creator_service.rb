module Events
  class EventCreatorService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
    end

    private

    attr_accessor :params
  end
end

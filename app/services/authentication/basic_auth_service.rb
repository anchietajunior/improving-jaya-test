module Authentication
  class BasicAuthService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      Result.new(true, nil, authenticate!)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :params

    def authenticate!
      return "authenticated" if params[:login] == ENV['LOGIN'] && params[:password] == ENV['PASSWORD']
      raise NotAuthorizedException
    end
  end
end

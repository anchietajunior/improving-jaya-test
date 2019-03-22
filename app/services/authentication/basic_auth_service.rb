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

    def auth_params?
      params[:login].present? && params[:password].present?
    end

    def corret_params?
      params[:login] == ENV['LOGIN'] && params[:password] == ENV['PASSWORD']
    end

    def authenticate!
      return "authenticated" if auth_params? && corret_params?
      raise NotAuthorizedException
    end
  end
end

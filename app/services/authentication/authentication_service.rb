module Authentication
  class AuthenticationService < ApplicationService
    def initialize(github_key, request_body)
      @github_key = github_key
      @request_body = request_body
    end

    def call
      Result.new(true, nil, authenticate!)
    rescue StandardError => e
      Result.new(false, e.message, nil)
    end

    private

    attr_accessor :github_key, :request_body

    def authenticate!
      local_key = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['GIT_KEY'], request_body)
      raise NotAuthorizedException unless Rack::Utils.secure_compare(local_key, github_key)
      "authenticated"
    end
  end
end

module BusinessCentral
  class BaseError < StandardError
    attr_accessor :response
    def initialize(message, response)
      super(message)
      @response = response
    end
  end

  class AuthenticationError < BaseError

  end

  class RateLimitError < BaseError

  end

  class ServiceError < BaseError

  end

  class ServiceUnavailableError < BaseError

  end

  class JsonError < BaseError

  end
end

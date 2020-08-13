module Mspec
  class SpecExample
    attr_reader :description, :result

    def initialize(description, result)
      @description = description
      @result = result
    end

    def success?
      @result.success?
    end

    def failure?
      !success?
    end

    def failure_message
      @result.failure_message
    end

    def trace
      @result.trace
    end
  end
end

module Mspec
  class SpecResult
    def initialize(expectation, matcher, error)
      @expectation = expectation
      @matcher = matcher
      @error = error
    end

    def success?
      !@error
    end

    def failure_message
      [
        "Expected: #{@matcher.value}",
        "Got: #{@expectation.value}",
      ]
    end

    def trace
      "#{@error.backtrace[1]}"
    end
  end
end

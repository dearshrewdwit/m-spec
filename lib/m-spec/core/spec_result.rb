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
        "  Expected: #{@expectation.value}",
        "  Got: #{@matcher.value}",
        "  #{@error.backtrace[1]}"
      ]
    end
  end
end

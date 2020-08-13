module Mspec
  class SpecResult
    def initialize(expectation, matcher, error)
      @test_code = expectation
      @expected_result = matcher
      @error = error
    end

    def success?
      !@error
    end

    def failure_message
      [
        "Expected: ".rjust(10) + "#{@expected_result.value.inspect}",
        "Got: ".rjust(10) + "#{test_code_result.inspect}",
      ]
    end

    def trace
      "#{@error.backtrace[1]}"
    end

    private

    def test_code_result
      if @test_code.value.is_a?(Proc)
        @expected_result.test_code_output_string
      else
        @test_code.value
      end
    end
  end
end

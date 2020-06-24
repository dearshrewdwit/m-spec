module Mspec
  class SpecResult
    def initialize(error)
      @error = error
    end

    def success?
      !@error
    end

    def simple_stack_trace
      [@error.backtrace[1]]
    end
  end
end

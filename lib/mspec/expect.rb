module Mspec
  class Expect
    def initialize(value)
      @value = value
    end

    def to(matcher)
      matcher.check(@value)
    end
  end
end

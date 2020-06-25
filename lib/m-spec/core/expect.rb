module Mspec
  class Expect
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def to(matcher)
      begin
        raise SpecError.new unless matcher.check(@value)
      rescue SpecError => e
        data = e
      end

      SpecResult.new(self, matcher, data)
    end
  end
end

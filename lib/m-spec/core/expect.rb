module Mspec
  class Expect
    def initialize(value)
      @value = value
    end

    def to(matcher)
      begin
        raise SpecError.new unless matcher.check(@value)
      rescue SpecError => e
        data = e
      end

      SpecResult.new(data)
    end
  end
end

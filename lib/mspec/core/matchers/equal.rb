module Mspec
  module Matchers
    class Equal
      def initialize(value)
        @value = value
      end

      def check(value)
        @value == value
      end
    end
  end
end

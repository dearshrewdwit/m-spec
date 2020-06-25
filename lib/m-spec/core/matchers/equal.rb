module Mspec
  module Matchers
    class Equal
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def check(value)
        @value == value
      end
    end
  end
end

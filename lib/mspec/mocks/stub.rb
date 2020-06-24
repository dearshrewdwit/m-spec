module Mspec
  module Mocks
    class Stub
      attr_reader :name, :return_value

      def initialize(name, return_value)
        @name = name
        @return_value = return_value
      end
    end
  end
end

module Mspec
  module Mocks
    class Allow
      def initialize(obj)
        @obj = obj
      end

      def to(stub)
        @obj.define_singleton_method(stub.name) { stub.return_value }
      end
    end
  end
end

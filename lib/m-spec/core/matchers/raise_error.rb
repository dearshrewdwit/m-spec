require 'stringio'

module Mspec
  module Matchers
    class RaiseError
      attr_reader :value, :actual

      def initialize(value)
        @value = value
      end

      def check(block)
        @actual = catch_error do
          block.call
        end

        @value == @actual
      end

      private

      def catch_error(&block)
        begin
          block.call
        rescue StandardError => e
          e.class
        end
      end
    end
  end
end

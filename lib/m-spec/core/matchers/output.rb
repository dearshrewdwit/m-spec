require 'stringio'

module Mspec
  module Matchers
    class Output
      attr_reader :value, :actual

      def initialize(value)
        @value = value
      end

      def check(block)
        output = mock_output do
          block.call
        end
        @actual = output.string

        @value == @actual
      end

      private

      def mock_output(output = StringIO.new, &block)
        $stdout = output
        block.call
        $stdout = STDOUT
        output
      end
    end
  end
end

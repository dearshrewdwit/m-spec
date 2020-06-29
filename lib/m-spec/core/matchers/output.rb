require 'stringio'

module Mspec
  module Matchers
    class Output
      attr_reader :value, :test_code_output_string

      def initialize(value)
        @value = value
      end

      def check(block)
        output = mock_output do
          block.call
        end
        @test_code_output_string = output.string

        @value == @test_code_output_string
      end

      private

      def mock_output(output=StringIO.new, &block)
        $stdout = output
        block.call
        $stdout = STDOUT
        output
      end
    end
  end
end

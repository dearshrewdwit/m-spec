module Mspec
  class Specs
    attr_reader :data

    def initialize(file)
      @file = file
      @data = []
      @@instance = self
    end

    def run!
      require(@file)
      summary
    end

    def add(spec)
      @data << spec
    end

    def self.instance
      @@instance
    end

    def summary
      puts "\n---Summary---\n\n"
      puts "#{@data.length} examples found"
      failures = @data.select(&:failure?)

      puts "#{failures.length} failures"
      failures.each_with_index do |spec, index|
        puts "     \e[#{COLOUR_CODES[:red]}m#{index+1}. #{spec.trace}\e[0m"
      end
    end
  end
end

COLOUR_CODES = {
  green: 32,
  red: 31,
  light_blue: 36
}

def describe(str)
  puts str
  yield
end

def it(str, specs = Mspec::Specs.instance)
  spec_example = Mspec::SpecExample.new(str, yield)
  specs.add(spec_example)
  if spec_example.success?
    puts "  \e[#{COLOUR_CODES[:green]}m#{str}\e[0m"
  else
    puts "  \e[#{COLOUR_CODES[:red]}m#{str}\n\e[0m"
    spec_example.failure_message.each do |line|
      puts "    \e[#{COLOUR_CODES[:red]}m#{line}\e[0m"
    end
    puts "\n    \e[#{COLOUR_CODES[:light_blue]}m# #{spec_example.trace}\e[0m"
  end
end

def expect(obj = nil, &block)
  if !obj.nil?
    Mspec::Expect.new(obj)
  else
    Mspec::Expect.new(block)
  end
end

def output(string)
  Mspec::Matchers::Output.new(string)
end

def eq(obj)
  Mspec::Matchers::Equal.new(obj)
end

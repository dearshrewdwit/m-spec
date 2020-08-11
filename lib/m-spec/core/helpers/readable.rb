COLOUR_CODES = {
  green: 32,
  red: 31,
  light_blue: 36
}

def describe(str)
  puts str
  yield
end

def it(str)
  spec_result = yield
  if spec_result.success?
    puts "  \e[#{COLOUR_CODES[:green]}m#{str}\e[0m"
  else
    puts "  \e[#{COLOUR_CODES[:red]}m#{str}\e[0m"
    spec_result.failure_message.each do |line|
      puts "    \e[#{COLOUR_CODES[:red]}m#{line}\e[0m"
    end
    puts "    \e[#{COLOUR_CODES[:light_blue]}m# #{spec_result.trace}\e[0m"
  end
end

def expect(obj=nil, &block)
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

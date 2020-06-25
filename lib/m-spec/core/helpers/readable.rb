COLOUR_CODES = {
  true => 32,
  false => 31
}

def describe(str)
  puts str
  yield
end

def it(str)
  spec_result = yield
  colour_code = COLOUR_CODES[spec_result.success?]
  puts "  \e[#{colour_code}m#{str}\e[0m"
  unless spec_result.success?
    spec_result.failure_message.each do |line|
      puts "  \e[#{colour_code}m#{line}\e[0m"
    end
  end
end


def expect(obj)
  Mspec::Expect.new(obj)
end

def eq(obj)
  Mspec::Matchers::Equal.new(obj)
end

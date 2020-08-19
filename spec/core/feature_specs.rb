require 'stringio'

require_relative "../../lib/m-spec/core/expect"
require_relative "../../lib/m-spec/core/spec_error"
require_relative "../../lib/m-spec/core/spec_result"
require_relative "../../lib/m-spec/core/matchers/equal"
require_relative "../../lib/m-spec/core/matchers/output"
require_relative "../../lib/m-spec/core/matchers/raise_error"
require_relative "../../lib/m-spec/core/helpers/readable"

class Animal
  def roar
    "ROAAAARRRR!"
  end

  def show_it!
    puts roar
  end
end

describe 'The Animal' do
  it 'returns a string' do
    animal = Animal.new
    expect(animal.roar).to eq "ROAAAARRRR!"
  end

  it 'fails nicely' do
    animal = Animal.new
    expect(animal.roar).to eq "little roar!"
  end
end

describe 'Testing output using expect block syntax' do
  it 'returns the strings when it fails' do
    expect { puts('hello') }.to output("helslo\n")
  end

  it 'successfully mocks STDOUT' do
    animal = Animal.new

    expect { animal.show_it! }.to output("ROAAAARRRR!\n")
  end
end

describe 'Testing Raising errors' do
  it 'captures error type' do
    expect { raise StandardError }.to raise_error(StandardError)
  end

  it 'raising different error gives normal failure message' do
    expect { raise ArgumentError }.to raise_error(StandardError)
  end

  it 'not raising error gives normal failure message' do
    expect { 'hello' }.to raise_error(StandardError)
  end
end

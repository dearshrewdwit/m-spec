require_relative "../../lib/m-spec/core/expect"
require_relative "../../lib/m-spec/core/spec_error"
require_relative "../../lib/m-spec/core/spec_result"
require_relative "../../lib/m-spec/core/matchers/equal"
require_relative "../../lib/m-spec/core/helpers/readable"

class Animal
  def roar
    "ROAAAARRRR!"
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

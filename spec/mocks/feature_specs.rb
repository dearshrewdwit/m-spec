require_relative "../../lib/m-spec/core/expect"
require_relative "../../lib/m-spec/core/spec_error"
require_relative "../../lib/m-spec/core/spec_result"
require_relative "../../lib/m-spec/core/matchers/equal"
require_relative "../../lib/m-spec/core/helpers/readable"

require_relative "../../lib/m-spec/mocks/allow"
require_relative "../../lib/m-spec/mocks/mock"
require_relative "../../lib/m-spec/mocks/stub"
require_relative "../../lib/m-spec/mocks/helpers/readable"

describe 'test doubles' do
  it 'can be stubbed' do
    mock = test_double
    allow(mock).to receive(:speak) { 'Hello!' }
    expect(mock.speak).to eq 'Hello!'
  end
  it 'can have optional names' do
    mock = test_double('a name')
    allow(mock).to receive(:speak) { 'Hello!' }
    expect(mock.speak).to eq 'Hello!'
  end

  it 'can be sent messages with any args' do
    mock = test_double('a name')
    allow(mock).to receive(:speak) { 'Hello!' }
    expect(mock.speak('example arg')).to eq 'Hello!'
  end
end

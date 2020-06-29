require_relative "../../lib/m-spec/core/expect"
require_relative "../../lib/m-spec/core/spec_error"
require_relative "../../lib/m-spec/core/spec_result"
require_relative "../../lib/m-spec/core/matchers/equal"
require_relative "../../lib/m-spec/core/helpers/readable"

require_relative "../../lib/m-spec/mocks/allow"
require_relative "../../lib/m-spec/mocks/mock"
require_relative "../../lib/m-spec/mocks/stub"
require_relative "../../lib/m-spec/mocks/helpers/readable"

describe 'stubbing' do
  it 'we can mock too!' do
    mock = test_double("i'm a mock!")
    allow(mock).to receive(:speak) { 'Hello!' }
    expect(mock.speak).to eq 'Hello!'
  end
end

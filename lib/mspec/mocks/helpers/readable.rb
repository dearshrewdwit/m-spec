def test_double(name = 'anonymous')
  Mspec::Mocks::Mock.new(name)
end

def allow(obj)
  Mspec::Mocks::Allow.new(obj)
end

def receive(method, &block)
  Mspec::Mocks::Stub.new(method, block.call)
end

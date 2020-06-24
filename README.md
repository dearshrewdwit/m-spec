# Mspec

The lightest-weight spec framework in ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mspec

## Usage

Remember - you'll have to manage test setup and cleanup yourself.

```ruby
class Animal
  def roar
    "ROAAAARRRR!"
  end
end

describe 'The Animal' do
  it 'can roar' do
    animal = Animal.new
    expect(animal.roar).to eq "ROAAAARRRR!"
  end

  it 'gives a lovely red when it fails' do
    animal = Animal.new
    expect(animal.roar).to eq "little roar!"
  end

  describe 'stubbing' do
    it 'we can mock too!' do
      mock = test_double
      allow(mock).to receive(:speak) { 'Hello!' }
      expect(mock.speak).to eq 'Hello!'
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mspec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mspec project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mspec/blob/master/CODE_OF_CONDUCT.md).

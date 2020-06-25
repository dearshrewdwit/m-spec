# Mspec

The lightest-weight spec framework in ruby. Built for learning at [Makers](https://makers.tech).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'm-spec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install m-spec

## Usage

We care about isolating unit tests, so there's a very simple mocking library.

```ruby
# source code
class Animal
  def roar
    "ROAAAARRRR!"
  end
end

# test code
describe 'The Animal' do
  it 'can roar' do
    animal = Animal.new
    expect(animal.roar).to eq "ROAAAARRRR!"
  end

  it 'gives a lovely red when it fails' do
    animal = Animal.new
    expect(animal.roar).to eq "little roar!"
  end
end

describe 'stubbing' do
  it 'we can mock too!' do
    mock = test_double
    allow(mock).to receive(:speak) { 'Hello!' }
    expect(mock.speak).to eq 'Hello!'
  end
end
```

To run your specs, pass the spec file directly as an argument. You have to run individual spec files.

```sh
$ m-spec ./spec/animal_spec.rb
```

```
The Animal
  returns a string
  fails nicely
  /path/to/directory/app/spec/animal_spec.rb:11:in block (2 levels) in <top (required)>'
stubbing
  we can mock too!
```

It's got simple one-level indentation and simple colour coding for test passes and failures. Failures will give you only the spec file path and line number.

Remember - you'll have to manage test setup and test cleanup yourself, while keeping your test code dry also yourself. Make sure each test runs in isolation.

## Extending

After checking out the repo
```sh
$ git clone git@github.com:dearshrewdwit/m-spec.git
$ cd m-spec
```
Add more matchers, or extend the mocking library. Then build locally and use.
```sh
bundle exec rake build --trace
gem install pkg/m-spec-[version].gem
m-spec [spec-file]
```

## Pushing to Rubygems
Sign up for an account, check for the gem name you want, and then follow the hints and errors when you
```sh
$ bundle exec rake release
```

[Bundler docs](https://bundler.io/guides/creating_gem.html) are a good resource, as are the [rubygems docs](https://guides.rubygems.org/publishing/)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dearshrewdwit/m-spec. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mspec project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dearshrewdwit/m-spec/blob/master/CODE_OF_CONDUCT.md).

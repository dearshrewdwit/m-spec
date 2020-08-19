# Mspec

The lightest-weight spec framework in ruby. Built for learning at [Makers](https://makers.tech). You have three matchers, an equality matcher, an output matcher and an error matcher. Test setup and teardown is your responsibility. For additional features, you must extend the gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'm-spec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install m-spec

## Setup

Initialize m-spec with a `.m-spec` and a `.rubocop.yml` file
```sh
m-spec --init
```


## Usage

To run your specs, pass the spec file directly as an argument. You have to run individual spec files, or create a file that requires your specs.

```sh
$ m-spec ./spec/animal_spec.rb
# or
$ m-spec ./spec_runner.rb
```

Test suite produces a summary with itemised failures.
```
---Summary---

3 examples found
1 failures
     1. /path/to/directory/spec/animal_spec.rb:16:in `block (2 levels) in <top (required)>'

```

#### Simple test layout
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

  it 'fails nicely' do
    animal = Animal.new
    expect(animal.roar).to eq "little roar!"
  end
end
```
Test output:
```
The Animal
  returns a string
  fails nicely

    Expected: ROAAAARRRR!
         Got: little roar!

    # /path/to/directory/spec/animal_spec.rb:11:in `block (2 levels) in <top (required)>'
```


#### Mocks & stubs
We care about isolating unit tests, so there's a very simple mocking library.
```ruby
describe 'test doubles' do
  it 'can be stubbed' do
    mock = test_double
    allow(mock).to receive(:speak) { 'Hello!' }
    expect(mock.speak).to eq 'Hello!'
  end

  it 'causes NoMethodError when not accurately stubbed' do
    mock = test_double
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
```

#### Output
Temporarily replaces `$stdout` during the execution of the test using `StringIO`.

```ruby
describe 'testing output' do
  it 'captures strings' do
    expect { puts('hello') }.to output("hello\n")
  end
end

```

#### Raising Errors
Catches only StandardError or subclasses of StandardError.

```ruby
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
```

It's got simple one-level indentation, simple colour coding for test passes and failures, and simple failure messages with expected and actual values and the failing spec file path and line number.

Remember - you'll have to manage yourself: test setup and teardown, keeping test code dry, each test running in isolation, and loading source code properly.

## Rubocop

M-spec comes with rubocop by default, using this [set of rules](https://github.com/makersacademy/scaffolint). To configure your test suite to disable rubocop or to only run rubcop, add an optional configuration file named `.m-spec` to your project root where you run your specs from. You don't need the configuration file - by default your specs will run first, followed by rubocop.

You can add either of two options
- `--no-rubocop` which will ignore running rubocop
- `--only-rubocop` which will ignore running your tests

Example output:
```
---Readability Tests---

Inspecting 22 files
....C.C......C.....C..

Offenses:
[rubocop's itemised offenses]
```

See [rubocop documentation](https://docs.rubocop.org/rubocop/index.html) for more info - you might be interested in reading about rubocop's autocorrect command.


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
Sign up for an account, check for the gem name you want, change the gem metadata to represent what you want, and then follow the hints and errors when you
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

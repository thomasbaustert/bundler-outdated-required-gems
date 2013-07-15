# bundler-outdated-gems

Ever wanted to know which of your **required** gems in your Gemfile are out of date?

Running `bundler outdated` dumps all gems that are outdated not just those that
you have required in the Gemfile. And only those gems needs a `bundle update [--source]`.

## Installation

Add this line to your application's Gemfile:

    gem 'bundler-outdated-required-gems', required: 'bundler_outdated_required_gems

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bundler-outdated-gems

## Usage

To get the list of required and outdated gems run:

    $ rake gems:outdated:show

Output like:

    -> getting outdated gems via 'bundle outdated' ...
    -> getting required gems from Gemfile ...
    -> found 12 required and outdated gems (34 outdated gems overall).
    -> Gems to be updated:
    foo (0.2.4 > 0.1.2)
    ...

To get more output run:

    $ DEBUG=1 rake gems:outdated:show


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

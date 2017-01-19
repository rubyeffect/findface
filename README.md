# Findface

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/findface`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'findface'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install findface

## Usage

The details on usage of "findface" gem are present at: `http://blog.rubyeffect.com/category/findface/`. If you wish to see Findface's API documentation, please visit the url: `https://findface.pro/en/docs.html`

1. Add gem to your application’s Gemfile

    gem 'findface'

2. Set the API key and mode in initializer file (config/initializers/findface.rb)

    Findface.api_key = 'YOUR-API-KEY'

3. Use the gem 🙂

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Running tests

To the run tests get key from `https://saas.findface.pro/account/dashboard` then run:

```console
$ env FINDFACE_API_KEY='<YOUR-API-KEY>' rspec
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/findface. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## About RubyEffect

![RubyEffect](http://blog.rubyeffect.com/wp-content/uploads/2015/05/cropped-re_original_logo.png)

RubyEffect builds intuitive, live and elegant software that solves real world problems. We love open source and it's community.

Liked this gem? You may also like the articles we post on our [blog](http://blog.rubyeffect.com). Please do check

We would love to work on your ideas and see them grow. Say hello @ http://rubyeffect.com/contact

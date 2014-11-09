# Omniauth::Plangrade

Omniauth Strategy for plangrade. Find out more about the plangrade API at docs.plangrade.com

## Installation

Add omniauth-oauth2 and this line to your application's Gemfile:

    gem 'omniauth-plangrade', git: 'https://github.com/topherreynoso/omniauth-plangrade'

And then execute:

    $ bundle install

## Usage

You need to add the following to your `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :plangrade, "your_key", "your_secret", redirect_uri: "redirect_uri"
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
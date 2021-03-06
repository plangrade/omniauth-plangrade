# OmniAuth plangrade
[![Gem Version](https://badge.fury.io/rb/omniauth-plangrade.svg)](http://badge.fury.io/rb/omniauth-plangrade)
[![Code Climate](https://codeclimate.com/github/topherreynoso/omniauth-plangrade/badges/gpa.svg)](https://codeclimate.com/github/topherreynoso/omniauth-plangrade)
[![Build Status](https://travis-ci.org/topherreynoso/omniauth-plangrade.svg?branch=master)](https://travis-ci.org/topherreynoso/omniauth-plangrade)
[![Coverage Status](https://coveralls.io/repos/topherreynoso/omniauth-plangrade/badge.png?branch=master)](https://coveralls.io/r/topherreynoso/omniauth-plangrade?branch=master)

plangrade OAuth2 strategy for OmniAuth.  
Supports the OAuth 2.0 server-side and client-side flows. Read the plangrade docs for more details: [docs.plangrade.com](https://docs.plangrade.com/#authentication). Additionally, this may be used in conjunction with [plangrade-ruby](https://github.com/topherreynoso/plangrade-ruby) in order to refresh tokens and access plangrade API endpoints.

## Installing

Add omniauth-oauth2 and this line to your application's Gemfile:

    gem 'omniauth-plangrade'

Then execute:

    $ bundle install

## Usage

`OmniAuth::Strategies::Plangrade` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: [https://github.com/intridea/omniauth](https://github.com/intridea/omniauth).

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :plangrade, ENV['PLANGRADE_CLIENT_ID'], ENV['PLANGRADE_CLIENT_SECRET']
end
```

[See the example rails app for full examples](https://github.com/topherreynoso/plangrade-ruby-client) of both the server and client-side flows.

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'plangrade',
  :uid => '1234567',
  :info => {
    :name => 'Compliance Man',
    :email => 'compliance@plangrade.com',
  },
  :credentials => {
    :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
    :refresh_token => 'ABCDEF...', #OAuth 2.0 refresh_token, which you may wish to store
    :expires_at => 1321747205, # when the access token expires (it always will)
    :expires => true # this will always be true
  },
  :extra => {
    :raw_info => {
      :id => '1234567',
      :name => 'Compliance Man',
      :email => 'compliance@plangrade.com',
    }
  }
}
```

### How it Works

The client-side flow is supported by parsing the authorization code from the signed request which plangrade places in a cookie.

When you call `/auth/plangrade/callback`, the success callback will pass the cookie back to the server. omniauth-plangrade will see this cookie and:

1. parse it,
2. extract the authorization code contained in it,
3. and hit plangrade and obtain an access token which will get placed in the `request.env['omniauth.auth']['credentials']` hash.

## Token Expiry

The expiration time of the access token you obtain is 2 hours.
The refresh_token, however, has no expiration and may be used until a user revokes your app's access.

## License

Copyright (c) 2014 Christopher Reynoso

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

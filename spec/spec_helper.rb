$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'oauth2'
require 'omniauth'
require 'omniauth-oauth2'
require 'omniauth/plangrade'

WebMock.disable_net_connect!(:allow => 'coveralls.io')

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, :type => :strategy
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

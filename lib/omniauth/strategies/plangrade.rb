require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Plangrade < OmniAuth::Strategies::OAuth2
      option :name, :plangrade

      option :client_options, {
        :site => "https://plangrade.com",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :name => raw_info["name"]
        }
      end

      def raw_info
        if @raw_info
          return @raw_info
        else
          result = access_token.get('/api/v1/me')
          @raw_info = JSON.parse(result.body)
          return @raw_info
        end
      end
    end
  end
end
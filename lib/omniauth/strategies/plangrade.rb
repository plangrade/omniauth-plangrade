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
        @raw_info ||= JSON.parse(access_token.get('api/v1/me.json').body)
      end
    end
  end
end
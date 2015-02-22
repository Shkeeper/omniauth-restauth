require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Restauth < OmniAuth::Strategies::OAuth2

      option :client_options, {
                                site: '192.168.1.5:8080',
                                authorize_url: '/oauth/authorize',
                                token_url: '/oauth/token'
                            }

      uid { raw_info['id'].to_s }

      info do
        {
            name:     raw_info['name'],
            username: raw_info['username'],
            email:    raw_info['email']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end


OmniAuth.config.add_camelization 'restauth', 'Restauth'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Dribbble < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://api.dribbble.com',
        authorize_url: 'https://dribbble.com/oauth/authorize',
        token_url: 'https://dribbble.com/oauth/token'
      }

      def request_phase
        super
      end

      def callback_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email'],
          nickname: raw_info['username'],
          location: raw_info['location'],
          description: raw_info['bio'],
          image: raw_info['avatar_url'],
          urls: {
            dribbble: raw_info['html_url'],
            web: raw_info['links']['web'],
            twitter: raw_info['links']['twitter']
          }
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/v2/user').parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

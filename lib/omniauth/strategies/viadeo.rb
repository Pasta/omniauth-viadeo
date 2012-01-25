require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Viadeo < OmniAuth::Strategies::OAuth2
      option :name, "viadeo"

      uid{ raw_info['id'] }

      extra do
        {
          'raw_info' => raw_info
        }
      end

      option :client_options, {
          :site => 'https://api.viadeo.com/',
          :authorize_url => 'https://secure.viadeo.com/oauth-provider/authorize2',
          :token_url => 'https://secure.viadeo.com/oauth-provider/access_token2'
        }
      
      def auth_hash
        OmniAuth::Utils.deep_merge(
          super, {
            'uid' => raw_info['id'],
            'user_info' => info,
            'extra' => {
              'user_hash' => raw_info,
            },
          }
        )
      end

      def raw_info
        @raw_info ||= MultiJson.decode(@access_token.get('/me').body)
      end

      def request_phase
        options[:response_type] ||= 'code'
        super
      end

      def callback_phase
        options[:grant_type] ||= 'authorization_code'
        super
      end

      info do
        {
          :name => raw_info['name'],
          :link => raw_info['link'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :gender => raw_info['gender'],
          :nickname => raw_info['nickname'],
          :has_picture => raw_info['has_picture'] ,         
          :picture_small => raw_info['picture_small'],
          :picture_large => raw_info['picture_large'],
          :headline => raw_info['headline'],
          :introduction => raw_info['introduction'],
          :interests => raw_info['interests'],
          :location => raw_info['location'],
          :is_premium => raw_info['is_premium'],
          :premium_since => raw_info['premium_since']         
        }
      end
      
    end
  end
end


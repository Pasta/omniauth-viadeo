require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Viadeo < OmniAuth::Strategies::OAuth2
      def initialize(app, client_id=nil, client_secret=nil, options = {}, &block)
        client_options = {
          :site => 'https://api.viadeo.com/',
          :authorize_url => 'https://secure.viadeo.com/oauth-provider/authorize2',
          :token_url => 'https://secure.viadeo.com/oauth-provider/access_token2'
        }
        super(app, :viadeo, client_id, client_secret, client_options, options, &block)
      end
      
      def auth_hash
        OmniAuth::Utils.deep_merge(
          super, {
            'uid' => user_data['id'],
            'user_info' => user_info,
            'extra' => {
              'user_hash' => user_data,
            },
          }
        )
      end

      def user_data
        @data ||= MultiJson.decode(@access_token.get('/me').body)
      end

      def request_phase
        options[:response_type] ||= 'code'
        super
      end

      def callback_phase
        options[:grant_type] ||= 'authorization_code'
        super
      end

      def user_info
        {
          'name' => user_data['name'],
          'link' => user_data['link'],
          'first_name' => user_data['first_name'],
          'last_name' => user_data['last_name'],
          'gender' => user_data['gender'],
          'nickname' => user_data['nickname'],
          'has_picture' => user_data['has_picture'] ,         
          'picture_small' => user_data['picture_small'],
          'picture_large' => user_data['picture_large'],
          'headline' => user_data['headline'],
          'introduction' => user_data['introduction'],
          'interests' => user_data['interests'],
          'location' => user_data['location'],
          'is_premium' => user_data['is_premium'],
          'premium_since' => user_data['premium_since']         
        }
      end
      
    end
  end
end

OmniAuth.config.add_camelization 'linkedin', 'LinkedIn'


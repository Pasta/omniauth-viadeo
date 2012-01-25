require 'spec_helper'

describe "OmniAuth::Strategies::Viadeo" do
  subject do
    OmniAuth::Strategies::Viadeo.new(nil)
  end

  context 'client options' do
    it 'has correct Viadeo api site' do
      subject.options.client_options.site.should eq('https://api.viadeo.com/')
    end

 

    it 'has correct access token path' do
      subject.options.client_options.token_url.should eq('https://secure.viadeo.com/oauth-provider/access_token2')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://secure.viadeo.com/oauth-provider/authorize2')
    end
  end

  context '#uid' do
    before :each do
      subject.stub(:raw_info) { { 'id' => '123' } }
    end

    it 'returns the id from raw_info' do
      subject.uid.should eq('123')
    end
  end
end

require 'spec_helper'

describe OmniAuth::Strategies::Dribbble do
  let(:access_token) { double('AccessToken', :options => {}) }

  subject { OmniAuth::Strategies::Dribbble.new({}) }

  before do
    subject.stub(:access_token).and_return(access_token)
  end

  context 'client options' do
    it 'has the correct site' do
      expect(subject.options.client_options.site).to eq('https://api.dribbble.com')
    end

    it 'has the correct authorize URL' do
      expect(subject.options.client_options.authorize_url).to eq('https://dribbble.com/oauth/authorize')
    end

    it 'has the correct token URL' do
      expect(subject.options.client_options.token_url).to eq('https://dribbble.com/oauth/token')
    end
  end
end

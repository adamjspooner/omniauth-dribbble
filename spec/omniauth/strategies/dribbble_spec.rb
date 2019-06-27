require 'spec_helper'

describe OmniAuth::Strategies::Dribbble do
  let(:access_token) { double('AccessToken', :options => {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', :parsed => parsed_response) }

  subject { OmniAuth::Strategies::Dribbble.new({}) }

  before do
    allow(subject).to receive(:access_token).and_return(access_token)
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

  context '#raw_info' do
    it 'uses absolute paths' do
      expect(access_token).to receive(:get).with('/v1/user').and_return(response)
      expect(subject.raw_info).to eq(parsed_response)
    end
  end

  context '#callback_phase' do
    it 'does not contains query_string in callback_url' do
      allow(subject).to receive(:full_host).and_return('full_host')
      allow(subject).to receive(:script_name).and_return('dribbble')
      allow(subject).to receive(:query_string).and_return('query_string')
      expect(subject.callback_url).to_not include('query_string')
    end
  end
end

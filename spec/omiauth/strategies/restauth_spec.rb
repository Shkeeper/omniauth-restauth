require 'spec_helper'

describe OmniAuth::Strategies::Restauth do

  let(:access_token) { double('AccessToken') }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', parsed: parsed_response) }

  let(:enterprise_site)           { '192.168.1.5:8080' }
  let(:enterprise_authorize_url)  { '/oauth/authorize' }
  let(:enterprise_token_url)      { '/oauth/access_token' }

  let(:gitlab_service) { OmniAuth::Strategies::Restauth.new({}) }
  let(:enterprise) do
    OmniAuth::Strategies::Restauth.new('gitlabkey', 'gitlabsecret',
                                     client_options: {
                                         site: enterprise_site,
                                         authorize_url: enterprise_authorize_url,
                                         token_url: enterprise_token_url
                                     }
    )
  end

  subject { gitlab_service }

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  describe 'client options' do
    context 'with defaults' do
      subject { gitlab_service.options.client_options }

      its(:site) { is_expected.to eq '192.168.1.5:8080' }
      its(:authorize_url) { is_expected.to eq '/oauth/authorize' }
      its(:token_url) { is_expected.to eq '/oauth/token' }
    end

    context 'with override' do
      subject { enterprise.options.client_options }

      its(:site) { is_expected.to eq enterprise_site }
      its(:authorize_url) { is_expected.to eq enterprise_authorize_url }
      its(:token_url) { is_expected.to eq enterprise_token_url }
    end
  end

  describe '#raw_info' do
    it 'sent request to current user endpoint' do
      expect(access_token).to receive(:get).with('/me').and_return(response)
      expect(subject.raw_info).to eq(parsed_response)
    end
  end
end
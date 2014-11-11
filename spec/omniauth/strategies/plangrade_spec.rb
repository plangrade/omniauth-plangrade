require 'spec_helper'

describe OmniAuth::Strategies::Plangrade do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::Plangrade.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq(:plangrade)
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://plangrade.com')
    end
  end
end
require 'spec_helper'

describe OmniAuth::Strategies::Plangrade do
  subject { OmniAuth::Strategies::Plangrade.new(nil) }

  it 'should add a camelization for itself' do
    expect(OmniAuth::Utils.camelize('plangrade')).to eq('Plangrade')
  end

  describe '#client' do
    it 'has correct Plangrade site' do
      expect(subject.client.site).to eq('https://plangrade.com')
    end

    it 'has correct authorize url' do
      expect(subject.client.options[:authorize_url]).to eq('/oauth/authorize')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('/oauth/token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      expect(subject.callback_path).to eq('/auth/plangrade/callback')
    end
  end

  describe '#uid' do
    before :each do
      allow(subject).to receive(:raw_info) { { :id => 'uid' } }
    end

    it 'returns the id from raw_info' do
      expect(subject.uid).to eq('uid')
    end
  end

  describe '#info' do
    context 'and therefore has all the necessary fields' do
      before :each do
        allow(subject).to receive(:raw_info) {
          {
            'name' => 'John Doe',
            'email' => 'compliance@plangrade.com'
          }
        }
      end

      it { expect(subject.info).to have_key :name }
      it { expect(subject.info).to have_key :email }
    end

    context 'and does not fail with empty response' do
      before :each do
        allow(subject).to receive(:raw_info) { {} }
      end

      it { expect { subject.info }.not_to raise_error }
    end
  end
end
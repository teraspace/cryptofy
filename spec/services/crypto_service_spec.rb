require 'rails_helper'

RSpec.describe CryptoService, type: :service do

  let(:subject) { CryptoService.new }

  describe '#cryptos' do
    it "received a list of cryptos" do
      VCR.use_cassette("crypto_service") do
        cryptos = subject.cryptos
        expect(cryptos.first["asset_id_quote"]).to eq 'ADA'
        expect(cryptos.class).to eq Array
      end
    end

  end

  describe "errrors from crypto_api" do
    before do
      # We send the recuest to a erroneous resource
      stub_const("CryptoService::CRYPTO_API_URL", "https://rest.coinapi.io/v9/ecchangerate")
    end

    it "received error from CryptoService" do
      VCR.use_cassette("crypto_service_error") do
        expect { subject.cryptos }.to raise_error(CryptoApiPermanentError)
      end
    end
  end
end

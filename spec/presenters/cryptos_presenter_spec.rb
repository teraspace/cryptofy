require 'rails_helper'

RSpec.describe CryptosPresenter, type: :presenter do
  before(:each) do
    VCR.insert_cassette "cryptos"
  end

  let(:crypto_service) { CryptoService.new }
  let(:cryptos_presenter) { CryptosPresenter.new(crypto_service.cryptos, CryptoPresenter) }

  describe '#cryptos' do
    it "receive cryptos in the presenter" do
      expect(cryptos_presenter.class).to eq CryptosPresenter
      expect(cryptos_presenter.results.first.class).to eq CryptoPresenter
    end
  end
end

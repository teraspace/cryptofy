require 'rails_helper'

RSpec.describe CryptoPresenter, type: :presenter do
  describe "CryptoPresenter" do
    it 'should be able to present' do
      @crypto_presenter = nil
      @crypto_detail = nil

      VCR.use_cassette("crypto_presenter") do
        cryptos = CryptoService.new.cryptos
        @crypto_presenter =CryptoPresenter.new cryptos.first

        expect(@crypto_presenter.class).to eq CryptoPresenter
        expect(@crypto_presenter.asset_id_quote).to eq "ADA"
        expect(cryptos.size).to eq 3
      end
    end
  end
end

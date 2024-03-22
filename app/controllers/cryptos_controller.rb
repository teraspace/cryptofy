class CryptosController < ApplicationController
  include ErrorsManagement

  skip_before_action :protected_pages, only: [:index]

  def index
    crypto_service = CryptoService.new
    cryptos = crypto_service.cryptos

    @cryptos_presenter = CryptosPresenter.new cryptos, CryptoPresenter
  end
end

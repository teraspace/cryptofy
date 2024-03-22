class CryptoPresenter

  attr_accessor :time, :asset_id_quote, :rate

  def initialize(crypto)
    crypto = crypto.with_indifferent_access
    @time = crypto["time"]
    @asset_id_quote = crypto["asset_id_quote"]
    @rate = crypto["rate"]
  end

end

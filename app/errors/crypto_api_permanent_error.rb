class CryptoApiPermanentError < StandardError
  def initialize(message)
    super(message)
  end
end

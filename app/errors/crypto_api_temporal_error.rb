class CryptoApiTemporalError < StandardError
  def initialize(message)
    super(message)
  end
end

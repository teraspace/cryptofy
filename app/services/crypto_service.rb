require 'rest-client'

class CryptoService
  API_KEY = 'E3AAFD83-2A6C-49A3-A07B-B1CFEEF4F221'
  CRYPTO_API_URL = "https://rest.coinapi.io/v1/exchangerate"

  def initialize(options={})
    @asset = options[:asset] || 'BTC'
    @format = options[:format]
    @cryptos_url =  "#{CRYPTO_API_URL}/USD?apikey=#{API_KEY}&invert=true&output_format=#{@format}"
    @response = nil
  end

  def cryptos
    @response = request_crypto(@cryptos_url)
    @response = map_cryptos(@response)
  end

  def crypto(asset)
    crypto_url =  "#{CRYPTO_API_URL}/USD/#{asset}?apikey=#{API_KEY}&invert=true&output_format=#{@format}"
    @response = request_crypto(crypto_url)
    @response
  end

  private

  def request_crypto(url)

    resp = nil
    bailed_resp = nil

    cached_resp = Rails.cache.fetch("#{url}", expires_in: 1.minute) do
      begin
        resp = RestClient.get(url)
      rescue RestClient::MovedPermanently, RestClient::ImATeapot, RestClient::Unauthorized, RestClient::Forbidden => error
        raise CryptoApiPermanentError, error.message
      rescue RestClient::NotFound, RestClient::ExceptionWithResponse => error
        raise CryptoApiPermanentError, error.message
      else
        bailed_resp = JSON.parse(resp.body)
      end
    end

    Rails.cache.delete("#{url}") if cached_resp.class != Hash

    cached_resp == nil ? bailed_resp : cached_resp
  end

  def map_cryptos(data)
    data["rates"].select {
      |x| x["asset_id_quote"] == "ADA" || x["asset_id_quote"] == "BTC" || x["asset_id_quote"] == "ETH"
    }
  end
end

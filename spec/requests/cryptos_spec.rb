require 'rails_helper'

RSpec.describe "cryptos", type: :request do
  describe "GET /index" do
    it "render cryptos page" do
      VCR.use_cassette("cryptos_page") do
        get cryptos_url

        expect(response.status).to eq(200)
        expect(document.body).to match_text 'ADA'
      end
    end
  end
end

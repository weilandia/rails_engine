require "rails_helper"

RSpec.describe "GET /api/v1/transactions/random" do
  it "returns random data for a transaction" do
    10.times do
      create(:transaction)
    end

    responses = []

    10.times do
      get "/api/v1/transactions/random"
      expect(response).to have_http_status("200")
      expect(json_body.class).to eq(Hash)
      responses << json_body
    end

    expect(responses.uniq.length).to be > 1
  end
end

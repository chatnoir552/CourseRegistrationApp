require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  describe "GET /search" do
    it "returns http success" do
      get "/schedules/search"
      expect(response).to have_http_status(:success)
    end
  end

end

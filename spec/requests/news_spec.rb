require 'spec_helper'

describe "News" do
  describe "GET /news" do
    it "works! (now write some real specs)" do
      get news_index_path
      expect(response.status).to be(200)
    end
  end
end

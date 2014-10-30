require 'spec_helper'

describe "Faqs" do
  describe "GET /faqs" do
    it "works! (now write some real specs)" do
      get faqs_path
      expect(response.status).to be(200)
    end
  end
end

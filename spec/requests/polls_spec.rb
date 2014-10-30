require 'spec_helper'

describe "Polls" do
  describe "GET /polls" do
    it "works! (now write some real specs)" do
      get polls_path
      expect(response.status).to be(200)
    end
  end
end

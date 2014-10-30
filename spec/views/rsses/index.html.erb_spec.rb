require 'spec_helper'

describe "rsses/index" do
  before(:each) do
    assign(:rsses, [
      stub_model(Rss,
        :organization_id => 1,
        :url => "Url"
      ),
      stub_model(Rss,
        :organization_id => 1,
        :url => "Url"
      )
    ])
  end

  it "renders a list of rsses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end

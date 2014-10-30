require 'spec_helper'

describe "polls/index" do
  before(:each) do
    assign(:polls, [
      stub_model(Poll,
        :question => "MyText",
        :organization_id => 1
      ),
      stub_model(Poll,
        :question => "MyText",
        :organization_id => 1
      )
    ])
  end

  it "renders a list of polls" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

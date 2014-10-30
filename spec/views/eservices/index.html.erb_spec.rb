require 'spec_helper'

describe "eservices/index" do
  before(:each) do
    assign(:eservices, [
      stub_model(Eservice,
        :name => "Name",
        :description => "MyText",
        :url => "Url",
        :owner => nil
      ),
      stub_model(Eservice,
        :name => "Name",
        :description => "MyText",
        :url => "Url",
        :owner => nil
      )
    ])
  end

  it "renders a list of eservices" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

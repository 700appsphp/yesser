require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :name => "Name",
        :description => "MyText",
        :longitude => 1.5,
        :latitude => 1.5,
        :address => "MyText",
        :mission => "MyText",
        :vision => "MyText",
        :message => "MyText",
        :logo => "Logo",
        :website => "Website"
      ),
      stub_model(Organization,
        :name => "Name",
        :description => "MyText",
        :longitude => 1.5,
        :latitude => 1.5,
        :address => "MyText",
        :mission => "MyText",
        :vision => "MyText",
        :message => "MyText",
        :logo => "Logo",
        :website => "Website"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end

require 'spec_helper'

describe "agencies/index" do
  before(:each) do
    assign(:agencies, [
      stub_model(Agency,
        :name => "Name",
        :description => "MyText",
        :longitude => 1.5,
        :latitude => 1.5,
        :address => "MyText",
        :logo => "Logo",
        :website => "Website",
        :organization_id => 1,
        :category_id => 2
      ),
      stub_model(Agency,
        :name => "Name",
        :description => "MyText",
        :longitude => 1.5,
        :latitude => 1.5,
        :address => "MyText",
        :logo => "Logo",
        :website => "Website",
        :organization_id => 1,
        :category_id => 2
      )
    ])
  end

  it "renders a list of agencies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

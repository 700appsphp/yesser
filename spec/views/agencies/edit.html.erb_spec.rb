require 'spec_helper'

describe "agencies/edit" do
  before(:each) do
    @agency = assign(:agency, stub_model(Agency,
      :name => "MyString",
      :description => "MyText",
      :longitude => 1.5,
      :latitude => 1.5,
      :address => "MyText",
      :logo => "MyString",
      :website => "MyString",
      :organization_id => 1,
      :category_id => 1
    ))
  end

  it "renders the edit agency form" do
    render

    assert_select "form[action=?][method=?]", agency_path(@agency), "post" do
      assert_select "input#agency_name[name=?]", "agency[name]"
      assert_select "textarea#agency_description[name=?]", "agency[description]"
      assert_select "input#agency_longitude[name=?]", "agency[longitude]"
      assert_select "input#agency_latitude[name=?]", "agency[latitude]"
      assert_select "textarea#agency_address[name=?]", "agency[address]"
      assert_select "input#agency_logo[name=?]", "agency[logo]"
      assert_select "input#agency_website[name=?]", "agency[website]"
      assert_select "input#agency_organization_id[name=?]", "agency[organization_id]"
      assert_select "input#agency_category_id[name=?]", "agency[category_id]"
    end
  end
end

require 'spec_helper'

describe "agencies/new" do
  before(:each) do
    assign(:agency, stub_model(Agency,
      :name => "MyString",
      :description => "MyText",
      :longitude => 1.5,
      :latitude => 1.5,
      :address => "MyText",
      :logo => "MyString",
      :website => "MyString",
      :organization_id => 1,
      :category_id => 1
    ).as_new_record)
  end

  it "renders new agency form" do
    render

    assert_select "form[action=?][method=?]", agencies_path, "post" do
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

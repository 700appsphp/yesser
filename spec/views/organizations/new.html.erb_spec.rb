require 'spec_helper'

describe "organizations/new" do
  before(:each) do
    assign(:organization, stub_model(Organization,
      :name => "MyString",
      :description => "MyText",
      :longitude => 1.5,
      :latitude => 1.5,
      :address => "MyText",
      :mission => "MyText",
      :vision => "MyText",
      :message => "MyText",
      :logo => "MyString",
      :website => "MyString"
    ).as_new_record)
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do
      assert_select "input#organization_name[name=?]", "organization[name]"
      assert_select "textarea#organization_description[name=?]", "organization[description]"
      assert_select "input#organization_longitude[name=?]", "organization[longitude]"
      assert_select "input#organization_latitude[name=?]", "organization[latitude]"
      assert_select "textarea#organization_address[name=?]", "organization[address]"
      assert_select "textarea#organization_mission[name=?]", "organization[mission]"
      assert_select "textarea#organization_vision[name=?]", "organization[vision]"
      assert_select "textarea#organization_message[name=?]", "organization[message]"
      assert_select "input#organization_logo[name=?]", "organization[logo]"
      assert_select "input#organization_website[name=?]", "organization[website]"
    end
  end
end

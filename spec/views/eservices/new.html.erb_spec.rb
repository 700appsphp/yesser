require 'spec_helper'

describe "eservices/new" do
  before(:each) do
    assign(:eservice, stub_model(Eservice,
      :name => "MyString",
      :description => "MyText",
      :url => "MyString",
      :owner => nil
    ).as_new_record)
  end

  it "renders new eservice form" do
    render

    assert_select "form[action=?][method=?]", eservices_path, "post" do
      assert_select "input#eservice_name[name=?]", "eservice[name]"
      assert_select "textarea#eservice_description[name=?]", "eservice[description]"
      assert_select "input#eservice_url[name=?]", "eservice[url]"
      assert_select "input#eservice_owner[name=?]", "eservice[owner]"
    end
  end
end

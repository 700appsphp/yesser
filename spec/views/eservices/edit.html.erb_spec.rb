require 'spec_helper'

describe "eservices/edit" do
  before(:each) do
    @eservice = assign(:eservice, stub_model(Eservice,
      :name => "MyString",
      :description => "MyText",
      :url => "MyString",
      :owner => nil
    ))
  end

  it "renders the edit eservice form" do
    render

    assert_select "form[action=?][method=?]", eservice_path(@eservice), "post" do
      assert_select "input#eservice_name[name=?]", "eservice[name]"
      assert_select "textarea#eservice_description[name=?]", "eservice[description]"
      assert_select "input#eservice_url[name=?]", "eservice[url]"
      assert_select "input#eservice_owner[name=?]", "eservice[owner]"
    end
  end
end

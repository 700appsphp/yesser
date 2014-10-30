require 'spec_helper'

describe "categories/edit" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :name => "MyString",
      :description => "MyText",
      :organization_id => 1,
      :ancestry => "MyString",
      :owner => nil
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do
      assert_select "input#category_name[name=?]", "category[name]"
      assert_select "textarea#category_description[name=?]", "category[description]"
      assert_select "input#category_organization_id[name=?]", "category[organization_id]"
      assert_select "input#category_ancestry[name=?]", "category[ancestry]"
      assert_select "input#category_owner[name=?]", "category[owner]"
    end
  end
end

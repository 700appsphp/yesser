require 'spec_helper'

describe "categories/new" do
  before(:each) do
    assign(:category, stub_model(Category,
      :name => "MyString",
      :description => "MyText",
      :organization_id => 1,
      :ancestry => "MyString",
      :owner => nil
    ).as_new_record)
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do
      assert_select "input#category_name[name=?]", "category[name]"
      assert_select "textarea#category_description[name=?]", "category[description]"
      assert_select "input#category_organization_id[name=?]", "category[organization_id]"
      assert_select "input#category_ancestry[name=?]", "category[ancestry]"
      assert_select "input#category_owner[name=?]", "category[owner]"
    end
  end
end

require 'spec_helper'

describe "categories/index" do
  before(:each) do
    assign(:categories, [
      stub_model(Category,
        :name => "Name",
        :description => "MyText",
        :organization_id => 1,
        :ancestry => "Ancestry",
        :owner => nil
      ),
      stub_model(Category,
        :name => "Name",
        :description => "MyText",
        :organization_id => 1,
        :ancestry => "Ancestry",
        :owner => nil
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Ancestry".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

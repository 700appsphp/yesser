require 'spec_helper'

describe "news/index" do
  before(:each) do
    assign(:news, [
      stub_model(News,
        :title => "Title",
        :body => "MyText",
        :organization_id => 1
      ),
      stub_model(News,
        :title => "Title",
        :body => "MyText",
        :organization_id => 1
      )
    ])
  end

  it "renders a list of news" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

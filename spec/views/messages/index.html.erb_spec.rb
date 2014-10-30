require 'spec_helper'

describe "messages/index", :type => :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :title => "Title",
        :description => "MyText",
        :image => "Image"
      ),
      Message.create!(
        :title => "Title",
        :description => "MyText",
        :image => "Image"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end

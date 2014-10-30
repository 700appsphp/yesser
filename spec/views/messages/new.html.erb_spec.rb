require 'spec_helper'

describe "messages/new", :type => :view do
  before(:each) do
    assign(:message, Message.new(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_title[name=?]", "message[title]"

      assert_select "textarea#message_description[name=?]", "message[description]"

      assert_select "input#message_image[name=?]", "message[image]"
    end
  end
end

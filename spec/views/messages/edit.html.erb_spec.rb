require 'spec_helper'

describe "messages/edit", :type => :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :title => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_title[name=?]", "message[title]"

      assert_select "textarea#message_description[name=?]", "message[description]"

      assert_select "input#message_image[name=?]", "message[image]"
    end
  end
end

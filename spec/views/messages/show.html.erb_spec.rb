require 'spec_helper'

describe "messages/show", :type => :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :title => "Title",
      :description => "MyText",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
  end
end

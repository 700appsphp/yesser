require 'spec_helper'

describe "faqs/index" do
  before(:each) do
    assign(:faqs, [
      stub_model(Faq,
        :question => "MyText",
        :answer => "MyText",
        :organization_id => 1
      ),
      stub_model(Faq,
        :question => "MyText",
        :answer => "MyText",
        :organization_id => 1
      )
    ])
  end

  it "renders a list of faqs" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

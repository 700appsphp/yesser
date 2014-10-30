require 'spec_helper'

describe "faqs/show" do
  before(:each) do
    @faq = assign(:faq, stub_model(Faq,
      :question => "MyText",
      :answer => "MyText",
      :organization_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end

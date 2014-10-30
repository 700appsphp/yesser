require 'spec_helper'

describe "faqs/edit" do
  before(:each) do
    @faq = assign(:faq, stub_model(Faq,
      :question => "MyText",
      :answer => "MyText",
      :organization_id => 1
    ))
  end

  it "renders the edit faq form" do
    render

    assert_select "form[action=?][method=?]", faq_path(@faq), "post" do
      assert_select "textarea#faq_question[name=?]", "faq[question]"
      assert_select "textarea#faq_answer[name=?]", "faq[answer]"
      assert_select "input#faq_organization_id[name=?]", "faq[organization_id]"
    end
  end
end

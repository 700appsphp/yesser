require 'spec_helper'

describe "faqs/new" do
  before(:each) do
    assign(:faq, stub_model(Faq,
      :question => "MyText",
      :answer => "MyText",
      :organization_id => 1
    ).as_new_record)
  end

  it "renders new faq form" do
    render

    assert_select "form[action=?][method=?]", faqs_path, "post" do
      assert_select "textarea#faq_question[name=?]", "faq[question]"
      assert_select "textarea#faq_answer[name=?]", "faq[answer]"
      assert_select "input#faq_organization_id[name=?]", "faq[organization_id]"
    end
  end
end

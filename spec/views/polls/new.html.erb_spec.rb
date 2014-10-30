require 'spec_helper'

describe "polls/new" do
  before(:each) do
    assign(:poll, stub_model(Poll,
      :question => "MyText",
      :organization_id => 1
    ).as_new_record)
  end

  it "renders new poll form" do
    render

    assert_select "form[action=?][method=?]", polls_path, "post" do
      assert_select "textarea#poll_question[name=?]", "poll[question]"
      assert_select "input#poll_organization_id[name=?]", "poll[organization_id]"
    end
  end
end

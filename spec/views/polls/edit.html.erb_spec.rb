require 'spec_helper'

describe "polls/edit" do
  before(:each) do
    @poll = assign(:poll, stub_model(Poll,
      :question => "MyText",
      :organization_id => 1
    ))
  end

  it "renders the edit poll form" do
    render

    assert_select "form[action=?][method=?]", poll_path(@poll), "post" do
      assert_select "textarea#poll_question[name=?]", "poll[question]"
      assert_select "input#poll_organization_id[name=?]", "poll[organization_id]"
    end
  end
end

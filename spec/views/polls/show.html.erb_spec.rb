require 'spec_helper'

describe "polls/show" do
  before(:each) do
    @poll = assign(:poll, stub_model(Poll,
      :question => "MyText",
      :organization_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end

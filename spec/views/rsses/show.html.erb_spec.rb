require 'spec_helper'

describe "rsses/show" do
  before(:each) do
    @rss = assign(:rss, stub_model(Rss,
      :organization_id => 1,
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Url/)
  end
end

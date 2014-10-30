require 'spec_helper'

describe "rsses/edit" do
  before(:each) do
    @rss = assign(:rss, stub_model(Rss,
      :organization_id => 1,
      :url => "MyString"
    ))
  end

  it "renders the edit rss form" do
    render

    assert_select "form[action=?][method=?]", rss_path(@rss), "post" do
      assert_select "input#rss_organization_id[name=?]", "rss[organization_id]"
      assert_select "input#rss_url[name=?]", "rss[url]"
    end
  end
end

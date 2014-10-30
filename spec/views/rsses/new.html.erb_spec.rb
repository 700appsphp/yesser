require 'spec_helper'

describe "rsses/new" do
  before(:each) do
    assign(:rss, stub_model(Rss,
      :organization_id => 1,
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new rss form" do
    render

    assert_select "form[action=?][method=?]", rsses_path, "post" do
      assert_select "input#rss_organization_id[name=?]", "rss[organization_id]"
      assert_select "input#rss_url[name=?]", "rss[url]"
    end
  end
end

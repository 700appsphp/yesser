require 'spec_helper'

describe "news/new" do
  before(:each) do
    assign(:news, stub_model(News,
      :title => "MyString",
      :body => "MyText",
      :organization_id => 1
    ).as_new_record)
  end

  it "renders new news form" do
    render

    assert_select "form[action=?][method=?]", news_index_path, "post" do
      assert_select "input#news_title[name=?]", "news[title]"
      assert_select "textarea#news_body[name=?]", "news[body]"
      assert_select "input#news_organization_id[name=?]", "news[organization_id]"
    end
  end
end

require 'spec_helper'

describe "news/edit" do
  before(:each) do
    @news = assign(:news, stub_model(News,
      :title => "MyString",
      :body => "MyText",
      :organization_id => 1
    ))
  end

  it "renders the edit news form" do
    render

    assert_select "form[action=?][method=?]", news_path(@news), "post" do
      assert_select "input#news_title[name=?]", "news[title]"
      assert_select "textarea#news_body[name=?]", "news[body]"
      assert_select "input#news_organization_id[name=?]", "news[organization_id]"
    end
  end
end

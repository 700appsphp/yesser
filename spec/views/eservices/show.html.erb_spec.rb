require 'spec_helper'

describe "eservices/show" do
  before(:each) do
    @eservice = assign(:eservice, stub_model(Eservice,
      :name => "Name",
      :description => "MyText",
      :url => "Url",
      :owner => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end

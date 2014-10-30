require 'spec_helper'

describe "organizations/show" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :name => "Name",
      :description => "MyText",
      :longitude => 1.5,
      :latitude => 1.5,
      :address => "MyText",
      :mission => "MyText",
      :vision => "MyText",
      :message => "MyText",
      :logo => "Logo",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Logo/)
    expect(rendered).to match(/Website/)
  end
end

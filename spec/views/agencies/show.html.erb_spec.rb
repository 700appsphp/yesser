require 'spec_helper'

describe "agencies/show" do
  before(:each) do
    @agency = assign(:agency, stub_model(Agency,
      :name => "Name",
      :description => "MyText",
      :longitude => 1.5,
      :latitude => 1.5,
      :address => "MyText",
      :logo => "Logo",
      :website => "Website",
      :organization_id => 1,
      :category_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Logo/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end

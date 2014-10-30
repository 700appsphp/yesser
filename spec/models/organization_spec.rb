# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  longitude   :float
#  latitude    :float
#  address     :text
#  mission     :text
#  vision      :text
#  message     :text
#  logo        :string(255)
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Organization do
  let(:organization) do
    Organization.create(name: "Test", description: "Some organization", 
                        longitude: 12.3456, latitude: 34.5678, address: "some st",
                        mission: "Great one!", vision: "best one!",
                        message: "some message", website: "www.google.com")
  end

  subject { organization }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :longitude }
  it { should respond_to :latitude }
  it { should respond_to :address }
  it { should respond_to :mission }
  it { should respond_to :vision }
  it { should respond_to :message }
  it { should respond_to :website }
  it { should be_valid }

  describe "name can't be blank" do
    before { organization.name = " " }
    it { should_not be_valid }
  end

  describe "longitude can't be nil" do
    before { organization.longitude = nil }
    it { should_not be_valid }
  end

  describe "latitude can't be nil" do
    before { organization.latitude = nil }
    it { should_not be_valid }
  end

  describe "address can't be blank" do
    before { organization.address = " " }
    it { should_not be_valid }
  end

  describe "mission can't be blank" do
    before { organization.mission = " " }
    it { should_not be_valid }
  end

  describe "vision can't be blank" do
    before { organization.vision = " " }
    it { should_not be_valid }
  end

  describe "message can't be blank" do
    before { organization.message = " " }
    it { should_not be_valid }
  end

  describe "website can't be blank" do
    before { organization.website = " " }
    it { should_not be_valid }
  end
end

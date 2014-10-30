# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  ancestry    :string(255)
#  owner_id    :integer
#  owner_type  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  type        :string(255)
#

require 'spec_helper'

describe AgencyCategory do
	before do
		@agency_category = AgencyCategory.new(name: "Test Category", owner_id: 1, 
																					owner_type: "Organization")
	end

	subject { @agency_category }

	it { should be_valid }
	it { should respond_to :name }
	it { should respond_to :description }
	it { should respond_to :owner }
	it { should respond_to :owner_id }
	it { should respond_to :owner_type }
end

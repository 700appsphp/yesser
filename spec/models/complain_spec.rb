# == Schema Information
#
# Table name: complaints
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  agency_id       :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  organization_id :integer
#

require 'spec_helper'

describe Complaint do
  pending "add some examples to (or delete) #{__FILE__}"
end

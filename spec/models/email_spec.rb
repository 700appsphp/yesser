# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  owner_id   :integer
#  owner_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Email do
  pending "add some examples to (or delete) #{__FILE__}"
end

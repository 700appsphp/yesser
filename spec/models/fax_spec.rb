# == Schema Information
#
# Table name: faxes
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  owner_id   :integer
#  owner_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Fax do
  pending "add some examples to (or delete) #{__FILE__}"
end

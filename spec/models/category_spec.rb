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

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
end

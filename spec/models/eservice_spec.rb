# == Schema Information
#
# Table name: eservices
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  url         :string(255)
#  owner_id    :integer
#  owner_type  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#  logo        :string(255)
#

require 'spec_helper'

describe Eservice do
  pending "add some examples to (or delete) #{__FILE__}"
end

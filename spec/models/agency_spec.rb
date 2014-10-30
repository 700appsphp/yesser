# == Schema Information
#
# Table name: agencies
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :text
#  longitude       :float
#  latitude        :float
#  address         :text
#  logo            :string(255)
#  website         :string(255)
#  organization_id :integer
#  category_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#  city            :string(255)
#  city_id         :integer
#

require 'spec_helper'

describe Agency do
  pending "add some examples to (or delete) #{__FILE__}"
end

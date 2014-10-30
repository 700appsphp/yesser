# == Schema Information
#
# Table name: social_networks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  owner_id   :integer
#  owner_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe SocialNetwork do
  pending "add some examples to (or delete) #{__FILE__}"
end

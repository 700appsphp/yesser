# == Schema Information
#
# Table name: apps
#
#  id              :integer          not null, primary key
#  url             :string(255)
#  platform        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  organization_id :integer
#  name            :string(255)
#  image           :string(255)
#  description     :string(255)
#

require 'spec_helper'

describe App do
  pending "add some examples to (or delete) #{__FILE__}"
end

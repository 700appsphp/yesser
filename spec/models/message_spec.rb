# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :text
#  image           :string(255)
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Message, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

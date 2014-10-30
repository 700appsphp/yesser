# == Schema Information
#
# Table name: news
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  body            :text
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe News do
  pending "add some examples to (or delete) #{__FILE__}"
end

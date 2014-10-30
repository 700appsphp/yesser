# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  answer        :text
#  answers_count :integer
#  poll_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end

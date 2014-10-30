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

class News < ActiveRecord::Base
  belongs_to :organization
end

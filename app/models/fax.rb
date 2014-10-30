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

class Fax < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  validates :number, format: /\A[0-9\+]{1}[0-9\-]{5,15}[0-9]\z/
end

# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  owner_id   :integer
#  owner_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Phone < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  validates :number,  format: { with: /\A[0-9\+]{1}[0-9]{2,15}\z/, 
            message: I18n.t("phones.number.invalid") }
end
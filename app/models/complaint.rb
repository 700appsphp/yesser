# == Schema Information
#
# Table name: complaints
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  agency_id       :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  organization_id :integer
#  receiver        :string(255)
#

class Complaint < ActiveRecord::Base
  belongs_to :organization
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, :allow_blank => true

  def use_amer
    self.receiver = "amer"
  end

  def use_email
    self.receiver = "email"
  end

  def use_amer?
    self.receiver == "amer"
  end

  def use_email?
    self.receiver == "email"
  end
end

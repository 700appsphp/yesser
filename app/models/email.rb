# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  owner_id   :integer
#  owner_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Email < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  VALID_EMAIL_REGEX = /\A([a-z0-9_\.-]+)@[\da-z\-]+(?:\.[a-z\-]+)*\.[a-z]{2,6}\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX , message: I18n.t("organizations.invalid_email") }
end


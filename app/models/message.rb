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

class Message < ActiveRecord::Base
  include APIFilterable
  belongs_to :organization
  validates :title, presence: true
  validates :description, presence: true
  mount_uploader :image, LogoUploader
end

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

class App < ActiveRecord::Base
  include APIFilterable
  include DefaultScope
  scope :platform, ->(platform) { where("platform = ?", platform)}
  scope :related_organization, ->(organization_id) { where.not("organization_id = ?", organization_id)}
  belongs_to :organization
  validates :platform, inclusion: { in: ["IOS", "Android", "Windows Phone"], 
                                    message: "%{value} is not a valid platform" } 
  validates :url, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }
  validates :url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :platform, presence: true
  mount_uploader :image, LogoUploader
end

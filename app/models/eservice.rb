require 'uri'
# == Schema Information
#
# Table name: eservices
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  url         :string(255)
#  owner_id    :integer
#  owner_type  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#  logo        :string(255)
#

class Eservice < ActiveRecord::Base
  include APIFilterable
  include DefaultScope
  belongs_to :owner, polymorphic: true
  belongs_to :category
  mount_uploader :logo, LogoUploader
  validates :name, presence: true
  validates :name, uniqueness: {:scope => :category_id}
  validates :description, presence: true
  validates :logo, presence: true
  scope :search, ->(statment) { where("name LIKE ?", "%#{statment}%") }
  validates :url, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }

  def logo_thumb_url
    logo.thumb.url
  end

  def organization_owned?
    self.owner_type == "Organization"
  end

  def agency_owned?
    self.owner_type == "Agency"
  end

  def get_root_category_id
    category.root.id if category
  end

end

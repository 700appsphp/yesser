require 'uri'
# == Schema Information
#
# Table name: social_networks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  owner_id   :integer
#  owner_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SocialNetwork < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  validates :name, presence: true
  validates :name, inclusion: { in: %w(Facebook Twitter LinkedIn) }
  validates :url, presence: true
  validates :url, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }
  validates :url, uniqueness: true
end

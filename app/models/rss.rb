require 'uri'
# == Schema Information
#
# Table name: rsses
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  url             :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Rss < ActiveRecord::Base
  belongs_to :organization
  validates :url, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ }
end

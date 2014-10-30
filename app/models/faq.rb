# == Schema Information
#
# Table name: faqs
#
#  id              :integer          not null, primary key
#  question        :text
#  answer          :text
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Faq < ActiveRecord::Base
  include APIFilterable
  belongs_to :organization
  scope :search, ->(statment) { where("question LIKE ?", "%#{statment}%")}
  validates :question, presence: true
  validates :answer, presence: true
end

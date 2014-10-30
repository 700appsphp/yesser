# == Schema Information
#
# Table name: polls
#
#  id              :integer          not null, primary key
#  question        :text
#  organization_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Poll < ActiveRecord::Base
  include APIFilterable
  belongs_to :organization
  validates :organization, presence: true
  validates :question, presence: true
  validates :answers, length: {maximum: 4, minimum: 4, too_short: "Must be exacly 4",
    too_long: "Must be exacly 4"
}
  has_many :answers, inverse_of: :poll, dependent: :destroy, order: 'answer'
  accepts_nested_attributes_for :answers, :allow_destroy => true

  scope :search, ->(statment) { where("question LIKE ?", "%#{statment}%")}

  def votes_count
    answers.map(&:answers_count).map(&:to_i).reduce(:+)
  end

  def answers_count
    answers.count
  end
end

# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  answer        :text
#  answers_count :integer
#  poll_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Answer < ActiveRecord::Base
  belongs_to :poll

  default_scope order: 'answer'

  validates :poll, presence: true
  validates :answer, presence: true
  before_validation :default_values

  def default_values
    self.answers_count ||= 0
  end

  def precentage
    if answers_count
      (answers_count.to_f / poll.votes_count.to_f) * 100
    else
      0  # to avoid divide on zero
    end
  end
end

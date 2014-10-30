# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  ancestry    :string(255)
#  owner_id    :integer
#  owner_type  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  type        :string(255)
#

class AgencyCategory < Category
  has_many :agencies, foreign_key: :category_id, dependent: :destroy

    def categorized_objects?
      !agencies.blank?
    end
  protected
    def categorized_objects
      agencies
    end
end

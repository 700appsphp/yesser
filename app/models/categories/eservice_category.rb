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

class EserviceCategory < Category
  has_many :eservices, foreign_key: :category_id, dependent: :destroy

    def categorized_objects?
      !eservices.blank?
    end
  
  def agency_owned?
    owner_type == "Agency"
  end

  protected
    def categorized_objects
      eservices
    end

end

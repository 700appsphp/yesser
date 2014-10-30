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

class Category < ActiveRecord::Base
  after_save :move_categoized_if_exist
  include APIFilterable
  include DefaultScope
  belongs_to :owner, polymorphic: true
  has_ancestry
  default_scope { order('name') }
  validates :name, presence: true
  scope :search, ->(statment) { where("name LIKE ?", "%#{statment}%") }

    def categorized_objects?
      raise NotImplementedError
    end

  protected
    def move_categoized_if_exist
      if parent
        objs = parent.categorized_objects
        if !objs.blank?
          objs.update_all category_id: id
        end
      end
    end

    def categorized_objects
      raise NotImplementedError
    end
end

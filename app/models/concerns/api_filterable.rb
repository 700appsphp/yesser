module APIFilterable
  extend ActiveSupport::Concern
  included do
    scope :created_after, ->(time) { where("created_at > ?", time)}
  end
end

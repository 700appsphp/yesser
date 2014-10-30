require 'uri'
# == Schema Information
#
# Table name: agencies
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :text
#  longitude       :float
#  latitude        :float
#  address         :text
#  logo            :string(255)
#  website         :string(255)
#  organization_id :integer
#  category_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#  city            :string(255)
#  city_id         :integer
#

class Agency < ActiveRecord::Base
  include APIFilterable
  include DefaultScope
  belongs_to :organization
  belongs_to :category
  belongs_to :city
  has_many :eservices, as: :owner, dependent: :destroy
  has_many :eservice_categories, as: :owner, dependent: :destroy
  has_many :emails, as: :owner, dependent: :destroy
  has_many :phones, as: :owner, dependent: :destroy
  has_many :faxes, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true
  accepts_nested_attributes_for :faxes, :allow_destroy => true
  accepts_nested_attributes_for :emails, :allow_destroy => true

  validates :name, presence: true
  validates :name, uniqueness: {:scope => :category_id}
  validates :city, presence: true
  validates :logo, presence: true
  validates :description, presence: true
  validates :website, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :website, url: {message: I18n.t('errors.messages.invalid_url')}
  mount_uploader :logo, LogoUploader
  scope :search, ->(statment) { where("name LIKE ?", "%#{statment}%")}

  def logo_thumb_url
    logo.thumb.url
  end

  def eservices_fresh_install?
    (!organization.allow_eservices?) and eservice_categories.blank? and eservices.blank?
  end

  def allow_eservices?
    !organization.allow_eservices?
  end

  def categorize_eservices?
    allow_eservices? and !eservice_categories.blank?
  end

  def get_root_category_id
    category.root.id if category
  end

  def eservices_count
    eservices.count
  end

  def has_eservices?
    eservices_count != 0
  end
end

require 'uri'
# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  longitude   :float
#  latitude    :float
#  address     :text
#  mission     :text
#  vision      :text
#  message     :text
#  logo        :string(255)
#  website     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Organization < ActiveRecord::Base
  has_many :agencies, dependent: :destroy do
    def has_eservices?
      !Eservice.where(owner_id: select(:id), owner_type: "Agency").blank?
    end
    def has_eservice_categories?
      !EserviceCategory.where(owner_id: select(:id), owner_type: "Agency").blank?
    end

    def has_eservices_related?
      has_eservices? or has_eservice_categories?
    end
  end
  has_many :eservices, as: :owner, dependent: :destroy
  has_many :apps, dependent: :destroy
  has_many :organization_users, dependent: :destroy
  accepts_nested_attributes_for :organization_users, :allow_destroy => true
  has_many :phones, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true
  has_many :faxes, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :faxes, :allow_destroy => true
  has_many :emails, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :emails, :allow_destroy => true
  has_many :social_networks, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :social_networks, :allow_destroy => true
  accepts_nested_attributes_for :apps, allow_destroy: true
  has_many :faqs, dependent: :destroy
  has_many :agency_categories, as: :owner, dependent: :destroy
  has_many :eservice_categories, as: :owner, dependent: :destroy
  has_many :news, dependent: :destroy
  validates :name, presence: true
  has_one :rss, dependent: :destroy
  has_many :polls, inverse_of: :organization, dependent: :destroy
  has_one :complaint, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :website, url: {message: I18n.t('errors.messages.invalid_url')}
  validates :name, uniqueness: true
  mount_uploader :logo, LogoUploader

  def miss_essential_data?
    name.blank? or description.blank? or longitude.blank? or latitude.blank? or logo.blank?
  end

  def logo_thumb_url
    logo.thumb.url
  end

  def eservices_fresh_install?
    eservices.blank? and eservice_categories.blank? and !agencies.has_eservices_related?
  end

  def allow_eservices?
    ((!eservices.blank?) or (!eservice_categories.blank?)) and !agencies.has_eservices_related?
  end

  def categorize_eservices?
    allow_eservices? and !eservice_categories.blank?
  end

  def agencies_fresh_install?
    agencies.blank? and agency_categories.blank?
  end

  def categorize_agencies?
    !agency_categories.blank?
  end

  def eservices_count
    eservices.count
  end

  def agencies_count
    agencies.count
  end

  def has_agencies?
    agencies_count != 0
  end
end

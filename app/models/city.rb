# == Schema Information
#
# Table name: cities
#
#  id           :integer          not null, primary key
#  arabic_name  :string(255)
#  english_name :string(255)
#  longitude    :float
#  latitude     :float
#

class City < ActiveRecord::Base
  has_many :agencies, dependent: :destroy
  before_validation :strip_white_spaces
  ENGLISH_NAME_REGEX = /\A([a-zA-Z]{1,}[- ]{0,1}){2,}\z/i
  AR_CHARS = "ذضصثقفغعهخحجدشسيبلاتنمكطئءؤرﻻىةوزظأﻷإﻹآﻵ".encode('utf-8')
  ARABIC_NAME_REGEX = /\A([#{AR_CHARS}]{1,}[ًٌٍَُِّْ]{0,2}[- ]{0,1}){2,}\z/
  validates :english_name, format: { with: ENGLISH_NAME_REGEX, 
                                     message: I18n.t("cities.english_name_error") }
  validates :arabic_name, format: { with: ARABIC_NAME_REGEX,
                                    message: I18n.t("cities.arabic_name_error") }
  validates :arabic_name, uniqueness: true
  validates :english_name, uniqueness: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  def get_name
    if I18n.locale.to_s == "ar"
      arabic_name
    else
      english_name
    end
  end

  private
  def strip_white_spaces
    self.arabic_name = self.arabic_name.strip
    self.english_name = self.english_name.strip
  end
end

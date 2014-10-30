module ApplicationHelper
  def full_title title
    if not title.empty?
      title + " | " + t("app_name")
    else
      t("app_name")
    end
  end

  def options_for_cities_select(cities, city_id)
    if I18n.locale.to_s == "ar"
      result = options_from_collection_for_select(cities, :id, :arabic_name, city_id)
    else
      result = options_from_collection_for_select(cities, :id, :english_name, city_id)
    end
    result = content_tag(:option, t('helpers.select_city'), value: "") + result
  end


  def fix_error_key(key)
    key.to_s.split(".")[0]
  end
end

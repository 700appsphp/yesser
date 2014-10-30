module DeviseOrganizationUserHelper
  def devise_error_messages_customed!
    return "" if resource.errors.empty?

    resource.errors.full_messages.map do |msg|
      content_tag(:div, msg, class: "callout callout-danger callout-signin") 
    end.join.html_safe
  end
end

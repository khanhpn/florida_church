module ApplicationHelper
  def active_navbar(prefix)
    request.original_url.include?(prefix) ? "active" : ""
  end

  def full_name(first_name, last_name)
    return "-" if first_name.blank? && last_name.blank?
    "#{last_name} #{first_name}"
  end
end

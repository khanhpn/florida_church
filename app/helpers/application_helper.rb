module ApplicationHelper
  MAIN_MENU_ADMIN = {
    HEADER: ["introduction", "logo_link"],
    HOME: ["mass", "mass_time", "special_notes", "adoration_times", "gallery_images"],
    BULLETIN: ["bulletin"],
    WORSHIP: [
      "teaching_mass", "altar_server", "altar_society", "children_liturgy", "ecuharistic_ministry",
      "funeral", "lector", "music_ministry", "ushers_hospital", "player_group"
    ],
    SACRAMENT: [
      "baptism", "reconciliation", "eucharist", "confirmation", "marriage",
      "holyorders", "anointing", "sacramental"
    ],
    ABOUT_US: [
      "welcome", "clergy", "deacon", "staff", "council", "history", "environment"
    ]
  }
  def active_navbar(prefix)
    request.path.gsub("/admin/", "") == prefix ? "active" : ""
  end

  def active_main_navbar(prefixs)
    prefixs.include?(request.path.gsub("/admin/", "")) ? "active" : ""
  end

  def active_main_navbar_open(prefixs)
    prefixs.include?(request.path.gsub("/admin/", "")) ? "menu-open" : ""
  end

  def full_name(first_name, last_name)
    return "-" if first_name.blank? && last_name.blank?
    "#{last_name} #{first_name}"
  end

  def full_path_image(image)
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
  end
end

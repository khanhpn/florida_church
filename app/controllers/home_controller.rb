class HomeController < ApplicationController
  def index
    @masses = Rails.cache.fetch("cache_normal_mass", expires_in: 15.minutes) do
      Mass.normal_mass.last(4)
    end

    @mass_ticked = Rails.cache.fetch("cache_normal_mass_ticked", expires_in: 15.minutes) do
      Mass.ticked_mass.last
    end

    @mass_time = Rails.cache.fetch("cache_normal_mass_time", expires_in: 15.minutes) do
      MassTime.last
    end

    @adoration_time = Rails.cache.fetch("cache_adoration_time", expires_in: 15.minutes) do
      AdorationTime.last
    end

    @special_note = Rails.cache.fetch("cache_special_note", expires_in: 15.minutes) do
      SpecialNote.last
    end

    @gallery_image = Rails.cache.fetch("cache_gallery_image", expires_in: 1.hours) do
      GalleryImage.display_order_top.first.contents
    end
  end
end

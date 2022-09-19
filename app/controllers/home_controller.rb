class HomeController < ApplicationController
  def index
    @masses = Mass.normal_mass.last(4)
    @mass_ticked = Mass.ticked_mass.last
    @mass_time = MassTime.last
    @adoration_time = AdorationTime.last
    @special_note = SpecialNote.last
    @gallery_image = GalleryImage.display_order_top.first
  end
end

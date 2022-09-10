class ArtCraftGroupController < ApplicationController
  def index
    @art_craft_group = ArtCraftGroup.display_article.last
    @relateds = ArtCraftGroup.where(display: true, is_main_article: false)
  end
end

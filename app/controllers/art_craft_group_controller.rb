class ArtCraftGroupController < ApplicationController
  def index
    @art_craft_group = ArtCraftGroup.display_article.last
    @relateds = ArtCraftGroup.where.not(id: @art_craft_group)
  end
end

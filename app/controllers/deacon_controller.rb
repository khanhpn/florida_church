class DeaconController < ApplicationController
  def index
    @deacon = Deacon.display_article.last
    @relateds = Deacon.where.not(id: @deacon)
  end
end

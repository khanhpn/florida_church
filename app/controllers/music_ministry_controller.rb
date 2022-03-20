class MusicMinistryController < ApplicationController
  def index
    @music_ministry = MusicMinistry.display_article.last
    @relateds = MusicMinistry.where.not(id: @music_ministry)
  end
end

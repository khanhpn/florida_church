class MusicMinistryController < ApplicationController
  def index
    @music_ministry = MusicMinistry.display_article.last
    @relateds = MusicMinistry.where(display: true, is_main_article: false)
  end
end

class MusicMinistryController < ApplicationController
  def index
    @music_ministry = MusicMinistry.display_article.last
  end
end

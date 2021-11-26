class BulletinController < ApplicationController
  def index
    @bulletin = Bulletin.last
  end
end

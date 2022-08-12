class ConfirmationController < ApplicationController
  def index
    @confirmation = Confirmation.display_article.last
    @relateds = Confirmation.where(display: true, is_main_article: false)
  end
end

class ConfirmationController < ApplicationController
  def index
    @confirmation = Confirmation.display_article.last
    @relateds = Confirmation.where.not(id: @confirmation, display: false, is_main_article: true)
  end
end

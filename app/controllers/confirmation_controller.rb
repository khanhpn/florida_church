class ConfirmationController < ApplicationController
  def index
    @confirmation = Confirmation.display_article.last
    @relateds = Confirmation.where.not(id: @confirmation)
  end
end

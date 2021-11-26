class ConfirmationController < ApplicationController
  def index
    @confirmation = Confirmation.display_article.last
  end
end

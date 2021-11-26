class ReconciliationController < ApplicationController
  def index
    @reconciliation = Reconciliation.display_article.last
  end
end

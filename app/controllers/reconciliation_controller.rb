class ReconciliationController < ApplicationController
  def index
    @reconciliation = Reconciliation.display_article.last
    @relateds = Reconciliation.where.not(id: @reconciliation, display: false, is_main_article: true)
  end
end

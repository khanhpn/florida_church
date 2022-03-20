class ReconciliationController < ApplicationController
  def index
    @reconciliation = Reconciliation.display_article.last
    @relateds = Reconciliation.where.not(id: @reconciliation)
  end
end

class ReconciliationController < ApplicationController
  def index
    @reconciliation = Reconciliation.display_article.last
    @relateds = Reconciliation.where(display: true, is_main_article: false)
  end
end

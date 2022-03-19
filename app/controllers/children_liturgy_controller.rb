class ChildrenLiturgyController < ApplicationController
  def index
    @children_liturgy = ChildrensLiturgy.display_article.last
    @relateds = ChildrensLiturgy.where.not(id: @children_liturgy, display: false, is_main_article: true)
  end
end

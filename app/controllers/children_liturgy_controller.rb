class ChildrenLiturgyController < ApplicationController
  def index
    @children_liturgy = ChildrensLiturgy.display_article.last
    @relateds = ChildrensLiturgy.where(display: true, is_main_article: false)
  end
end

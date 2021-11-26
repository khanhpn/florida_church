class ChildrenLiturgyController < ApplicationController
  def index
    @children_liturgy = ChildrensLiturgy.display_article.last
  end
end

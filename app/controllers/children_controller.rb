class ChildrenController < ApplicationController
  def index
    @children = Child.display_article.last
    @relateds = Child.where.not(id: @children)
  end
end

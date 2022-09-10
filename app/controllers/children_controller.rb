class ChildrenController < ApplicationController
  def index
    @children = Child.display_article.last
    @relateds = Child.where(display: true, is_main_article: false)
  end
end

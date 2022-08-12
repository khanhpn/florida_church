class ChildrenYouthController < ApplicationController
  def index
    @children_youth = ChildrenYouth.display_article.last
    @relateds = ChildrenYouth.where(display: true, is_main_article: false)
  end
end

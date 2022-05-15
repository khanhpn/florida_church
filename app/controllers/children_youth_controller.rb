class ChildrenYouthController < ApplicationController
  def index
    @children_youth = ChildrenYouth.display_article.last
    @relateds = ChildrenYouth.where.not(id: @children_youth)
  end
end

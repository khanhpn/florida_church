class ChildrenYouthController < ApplicationController
  def index
    @children_youth = Rails.cache.fetch("children_youth/last", expires_in: 1.hours) do
      ChildrenYouth.display_article.last
    end

    @relateds = Rails.cache.fetch("children_youth/main_article", expires_in: 1.hours) do
      ChildrenYouth.where(display: true, is_main_article: false)
    end
  end
end

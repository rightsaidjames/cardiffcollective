class TagsController < ApplicationController

  def index
    @skills = User.tag_counts_on(:skills).sort_by(&:count).reverse.take(5)
    @learnings = User.tag_counts_on(:learning).sort_by(&:count).reverse.take(5)
  end

  def show
    @tag = params[:id]
    @skilled = User.tagged_with(@tag, :on => :skills)
    @learning = User.tagged_with(@tag, :on => :learning)
  end

end

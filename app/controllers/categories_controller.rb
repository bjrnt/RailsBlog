class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
    if current_author then
      @posts = @category.posts.order(created_at: :desc)
    else
      @posts = @category.posts.where(is_public: true)
    end
  end
end

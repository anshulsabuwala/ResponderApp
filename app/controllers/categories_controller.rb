class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  responders :flash, :http_cache
  respond_to :html, :xml, :json
  def index
    respond_with(@categories = Category.all)
  end

  def show
    respond_with(@category)
  end

  def new
    respond_with(@category = Category.new)
  end

  def edit
  end

  # def create
  #   @category = Category.new(category_params)
  #   @category.save
  #   respond_with(@category)
  # end

  def create
    @category = Category.create(category_params)
    respond_with @category, location: -> { category_path(@category) }
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def interpolation_options
      { resource_name: @category.name }
    end
end

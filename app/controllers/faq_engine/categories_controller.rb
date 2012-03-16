class FaqEngine::CategoriesController < ApplicationController

  layout "faq_engine"

  def index
    @categories = model.roots.includes(:children).all
    respond_to do |format|
      format.html
    end
  end

  def show
    @category = model.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @category = model.new(params[:faq_engine_category])
    respond_to do |format|
      format.html
    end
  end

  def create
    @category = model.new(params[:faq_engine_category])
    respond_to do |format|
      if @category.save
        format.html { redirect_to faq_engine_category_path(@category) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @category = model.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @category = model.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(params[:faq_engine_category])
        format.html { redirect_to faq_engine_category_path(@category) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @category = model.find(params[:id])
    respond_to do |format|
      if @category.destroy
        format.html { redirect_to faq_engine_categories_path() }
      else
        format.html { render :action => "show" }
      end
    end
  end

  protected

  def model
    @model ||= FaqEngine::ActiveRecord::Category
  end

end

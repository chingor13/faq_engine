class FaqQuestionsController < ApplicationController

  def index
    @faqs = model.paginate(:page => params.fetch(:page, 1), :per_page => params.fetch(:per_page, 30))
    respond_to do |format|
      format.html
    end
  end

  def show
    @faq = model.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @faq = model.new(params[:faq])
    respond_to do |format|
      format.html
    end
  end

  def create
    @faq = model.new(params[:faq])
    respond_to do |format|
      if @faq.save
        format.html { redirect_to faq_path(@faq) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @faq = model.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @faq = model.find(params[:id])
    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        format.html { redirect_to faq_path(@faq) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @faq = model.find(params[:id])
    respond_to do |format|
      if @faq.destroy
        format.html { redirect_to faqs_path() }
      else
        format.html { render :action => "show" }
      end
    end
  end

  protected

  def model
    @model ||= FaqEngine.model || FaqEngine::ActiveRecord::Faq
  end

end
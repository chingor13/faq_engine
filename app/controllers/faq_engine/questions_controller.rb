class FaqEngine::QuestionsController < ApplicationController

  layout "faq_engine"
  before_filter :load_category

  def index
    @questions = @category.questions
    respond_to do |format|
      format.html
    end
  end

  def show
    @question = model.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @question = @category.questions.build(params[:faq_engine_question])
    respond_to do |format|
      format.html
    end
  end

  def create
    @question = @category.questions.build(params[:faq_engine_question])
    respond_to do |format|
      if @question.save
        format.html { redirect_to faq_engine_category_question_path(@category, @question) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @question = model.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @question = model.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:faq_engine_question])
        format.html { redirect_to faq_engine_category_question_path(@category, @question) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @question = model.find(params[:id])
    respond_to do |format|
      if @question.destroy
        format.html { redirect_to faq_engine_category_path(@category) }
      else
        format.html { render :action => "show" }
      end
    end
  end

  protected

  def parent_param
    params[:faq_engine_category_id]
  end

  def load_category
    @category = parent_model.find(parent_param)
  end

  def parent_model
    @parent_model ||= FaqEngine::ActiveRecord::Category
  end

  def model
    @model ||= FaqEngine::ActiveRecord::Question
  end

end

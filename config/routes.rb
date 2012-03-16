Rails.application.routes.draw do

  resources :categories, :module => :faq_engine, :as => "faq_engine_categories",  :path => I18n.t("faq_engine.routing.category_path") do
    resources :questions, :as => "faq_engine_questions", :path => I18n.t("faq_engine.routing.question_path")
  end

end

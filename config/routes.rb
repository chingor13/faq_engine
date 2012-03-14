Rails.application.routes.draw do

  resources :faq_categories do
    resources :faq_questions
  end

end
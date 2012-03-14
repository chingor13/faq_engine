Rails.application.routes.draw do

  scope "faq_engine", :module => :faq_engine, :as => "faq_engine" do
    resources :categories do
      resources :questions
    end
  end
end
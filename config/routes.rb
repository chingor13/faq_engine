Rails.application.routes.draw do

  resources :categories do
    resources :faqs
  end

end
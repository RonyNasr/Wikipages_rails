Rails.application.routes.draw do
  resources :industries do
    resources :businesses
  end
end

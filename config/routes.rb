Rails.application.routes.draw do

  root "posts#index"
  resources :posts do
    resources :comments
  end
  # other routes should be present as well
end

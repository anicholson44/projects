Rails.application.routes.draw do
  resources :project, only: [:index, :update, :destroy]
end

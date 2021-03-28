Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'conversations#index'
  resources :conversations, only: %i[create show new] do
    resources :messages, only: %i[create show index new] do 
      resources :thoughts, only: %i[create new]
    end
  end
  get '*path' => redirect('/')
end

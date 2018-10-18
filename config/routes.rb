Rails.application.routes.draw do
  devise_for :users

  root 'students#show', {id: Student.find_most_recent.id}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students, except: %i[index new edit] do
    resources :lessons, only: %i[create update destroy]
  end

  resources :calendar, only: %i[show]
end

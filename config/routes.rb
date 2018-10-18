Rails.application.routes.draw do
  devise_for :users

  puts Student.find_most_recent.name, Student.find_most_recent.id
  root 'students#show', {id: Student.find_most_recent.id}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students do
    resources :lessons
  end

  resources :calendar, only: %i[show]
end

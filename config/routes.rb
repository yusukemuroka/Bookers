Rails.application.routes.draw do
  root to: 'homes#top'
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 delete 'books/:id' => 'books#destroy' ,as: 'destroy_book'
 resources :books
end


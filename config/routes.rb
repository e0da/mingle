Mingle::Application.routes.draw do
  resources :people

  root to: 'people#new'

  get   '/signin',  to: 'sessions#new',     as: :sign_in
  post  '/signin',  to: 'sessions#create',  as: :sign_in
  match '/signout', to: 'sessions#destroy', as: :sign_out

  match '/admin' => redirect('/signin')
end

Mingle::Application.routes.draw do
  resources :people

  root to: 'people#new'

  get   '/signin',  to: 'sessions#new',     as: :sign_in
  post  '/signin',  to: 'sessions#create',  as: :sign_in
  match '/signout', to: 'sessions#destroy', as: :sign_out

  get   '/people/:id/like',    to: 'people#like',    as: :like_person
  get   '/people/:id/dislike', to: 'people#dislike', as: :dislike_person
  get   '/people/:id/meh',     to: 'people#meh',     as: :meh_person

  match '/admin' => redirect('/signin')
end

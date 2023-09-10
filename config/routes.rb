Rails.application.routes.draw do
  # get 'games/new'
  # get 'games/score'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new'
  post 'score', to: 'games#score'
  # Defines the root path route ("/")
  # root "articles#index"
end


# Prefix Verb URI Pattern      Controller#Action
#    new GET  /new(.:format)   games#new
#  score POST /score(.:format) games#score

#  get 'new', to: 'games#new'
#  post 'score', to: 'games#score'

# root to 'games#new', as 'new'
# post 'score', to: 'games#score'

Rails.application.routes.draw do
  root 'home#index'

  post '/links', to: 'links#create', as: :create_link
  get '/:lookup_code', to: 'home#redirect_lookup', as: :redirect_lookup
end

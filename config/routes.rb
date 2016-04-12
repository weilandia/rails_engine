Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/:table/find', as: :find, to: 'searches#find'
      get '/:table/find_all', as: :find_all, to: 'searches#find_all'
      get '/:table/random', as: :random, to: 'searches#random'
      resources :customers, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end

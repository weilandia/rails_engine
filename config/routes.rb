Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/:table/find', as: :find, to: 'searches#find'
      get '/:table/find_all', as: :find_all, to: 'searches#find_all'
      get '/:table/random', as: :random, to: 'searches#random'

      resources :customers, only: [:index, :show] do
        member { get 'invoices', 'transactions' }
      end

      resources :merchants, only: [:index, :show] do
        member { get 'items', 'invoices' }
      end

      resources :items, only: [:index, :show] do
        member { get 'invoice_items', 'merchant' }
      end

      resources :invoice_items, only: [:index, :show] do
        member { get 'item', 'invoice' }
      end

      resources :transactions, only: [:index, :show] do
        member { get 'invoice' }
      end

      resources :invoices, only: [:index, :show] do
        member { get  'transactions',
                      'invoice_items',
                      'customer',
                      'merchant',
                      'items'
                }
      end
    end
  end
end

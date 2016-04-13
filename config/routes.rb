Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/:table/find', as: :find, to: 'searches#find'
      get '/:table/find_all', as: :find_all, to: 'searches#find_all'
      get '/:table/random', as: :random, to: 'searches#random'

      resources :customers, only: [:index, :show] do
        member { get 'invoices', 'transactions', 'favorite_merchant' }
      end

      resources :merchants, only: [:index, :show] do
        collection { get :most_revenue, :most_items, :revenue }
        member { get :items, :invoices, :revenue, :favorite_customer, :customers_with_pending_invoices }
      end

      resources :items, only: [:index, :show] do
        collection { get 'most_revenue', 'most_items' }
        member { get 'invoice_items', 'merchant', 'best_day' }
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

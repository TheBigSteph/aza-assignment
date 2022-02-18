Rails.application.routes.draw do
  resources :transactions
  resources :customers
  get 'get_transaction_by_customer/:customer_id', to: "transactions#get_transaction_by_customer"
end

Rails.application.routes.draw do
  devise_for :clientes
  resources :produtos
  resource :carrinho, only: [:show]
  resources :item_carrinhos, only: [:create, :destroy]
  
  resources :pedidos, only: [:index, :show, :create] do
    member do
      patch :cancelar
    end
  end

  get "minha-conta", to: "clientes#conta", as: :minha_conta
  post "/mercado_pago/webhook", to: "webhooks#mercado_pago"

  root "produtos#index"
end
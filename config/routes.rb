Rails.application.routes.draw do
  devise_for :users
  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end

  scope '/api' do
    resources :products,  except: [:new, :edit] do
      resources :rates
    end

  get 'products/:id/rate_stats' => 'products#rate_stats'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end

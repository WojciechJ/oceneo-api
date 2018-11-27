Rails.application.routes.draw do
  devise_for :users
  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end

  scope '/api' do
    resources :products,  except: [:new, :edit] do
      resources :rates
    end

  end
end

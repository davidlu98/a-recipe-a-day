Rails.application.routes.draw do
  get 'stattic_pages/...'

  get 'static_pages/home'

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'  
end

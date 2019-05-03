Rails.application.routes.draw do
  get 'welcome/home'
  get 'welcome/app', as: 'app'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
end

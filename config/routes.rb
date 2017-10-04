require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  get 'fake/work'
  get 'students' => 'students#index'
end

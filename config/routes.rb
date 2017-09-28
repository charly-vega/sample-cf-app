Rails.application.routes.draw do
  get 'fake/work'
  
  get 'students' => 'students#index'
end

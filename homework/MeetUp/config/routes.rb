MeetUp::Application.routes.draw do
  
  root :to=> 'events#index'

  resources :venues

  resources :events

end

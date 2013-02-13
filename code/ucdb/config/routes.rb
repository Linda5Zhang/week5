Ucdb::Application.routes.draw do

  resources :roles


  resources :actors


  resources :movies


  #get '/', :controller => 'directors', :action => 'index'
	# root :to => 'directors#index'

  resources :directors




end

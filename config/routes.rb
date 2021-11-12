Rails.application.routes.draw do

  get '/plots', to: 'plots#index'
  delete '/plants/:id', to: 'plot_plants#destroy'
end

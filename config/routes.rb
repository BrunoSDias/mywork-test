Rails.application.routes.draw do
  root 'timetrackings#new'
  resources :geofences
  resources :timetrackings, except: [:destroy, :edit]
end

Rails.application.routes.draw do
  resources :logs
  resources :alarms

  match "/alarms/:id/state/:state" => "alarms#status", via: [:get, :post]
  match "/alarms/:id/motion_detected" => "alarms#motion_detected", via: :post

end

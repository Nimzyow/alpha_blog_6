Rails.application.routes.draw do
  #rails automatically knows that when we write pages, like we did below, it knows its the pages_controller that we are referring to.
  root "pages#home"
  # the words after # is simply the action/method on the controller to the left of the #
  get "about", to: "pages#about"
  resources :articles#, only: [:show, :index, :new, :create, :edit, :update]
end

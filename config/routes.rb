Rails.application.routes.draw do

  resources :task do
    collection do
      post :condirm
    end
  end
end

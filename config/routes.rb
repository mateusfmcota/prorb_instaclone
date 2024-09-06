Rails.application.routes.draw do
  resources :posts, only: [:create, :new] do
    resources :comments, only: [:create, :new] do
      post 'like', to: "likes#create_comment_like"
      delete 'like', to: "likes#destroy_comment_like"
    end
    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end
  end
  devise_for :users
  root "site#index"
end

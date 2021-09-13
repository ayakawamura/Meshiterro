Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"homes#top"

# post_imagesコントローラーのルート設定
  resources :post_images,only:[:new,:create,:index,:show,:destroy] do
    # いいね機能コントローラ
    resource :favorites,only:[:create,:destroy]
    # post_commentのルート設定　投稿画像に対してコメントするため以下のように親子関係になる
    resources :post_comments, only:[:create,:destroy]
  end
  
  resources :users,only:[:show, :edit, :update]
  
end

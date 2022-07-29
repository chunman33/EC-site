Rails.application.routes.draw do
  
  root to: 'customer/homes#top'
  
  get '/about', to: 'customer/homes#about'
  
  namespace :admin do #コントローラーのnamespace名（URLの先頭に付く）
    get '/', to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
  end
 
  
  scope module: :customer do #controllerだけにcustomerを追加
   resources :items, only: [:index, :show]
   resources :cart_items, only: [:index, :create, :update, :destroy] do 
        #↓resourcesで指定されている名前を任意のURLやアクション名に変更したい時(1つだけver)
        delete 'cart_item/destroy_all'
    end
    
   resources :orders, only: [:new, :index, :create, :show] do
      collection do #resourcesから任意のURLやアクション名に変更・追加したいのが複数ある時(idなしver)
        post 'confirm'
        get 'complete'
      end
   end
   
   resources :customers, only: [:edit, :update] do
     collection do
       get 'my_page', to: 'customers#show', as: :my_page
       get 'unsubscribe'
       patch 'withdraw'
     end
   end
  end
  
  
 
  # 顧客用
  # /customers/sign_in
  devise_for :customers, skip: [:password,], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions" 
  }
  devise_for :admins, skip:[:registrations, :password, :sessions], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_scope :admin do
    get '/admin/sign_in', to: 'admin/sessions#new', as: :new_admin_session
    post '/admin/sign_in', to: 'admin/sessions#create', as: :admin_session
    delete 'admin/sign_out', to: 'admin/sessions#destroy', as: :destroy_admin_session
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  # 顧客用
  # /customers/sign_in
  devise_for :customers, skip: [:password,], controllers: {
    registrations: "customer/registrations", #フォルダ名: "ファイル名"
    sessions: "customer/sessions" #フォルダ名: "ファイル名"
  }
  devise_for :admins, skip:[:registrations, :password,], controllers: {
    sessions: "admin/sessions"
  }
  
  root to: 'customer/homes#top'
  
  namespace :customer, path: "customers" do
    get 'my_page', to: 'customers#show'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

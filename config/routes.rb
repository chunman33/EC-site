Rails.application.routes.draw do
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
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

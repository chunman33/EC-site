Rails.application.routes.draw do
  # 顧客用
  # /customers/sign_in
  devise_for :customer, skip: [:password,], controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }
  devise_for :admins, skip:[:registrations, :password,], controllers: {
    sessions: "admin/sessions"
  }
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

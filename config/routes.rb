# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'home#index'

  devise_for :users

  resources :auditions
end

# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'auditions#new'

  devise_for :users

  resources :auditions
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'auditions#new'

  devise_for :users

  resources :auditions
end

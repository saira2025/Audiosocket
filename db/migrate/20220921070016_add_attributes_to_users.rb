# frozen_string_literal: true

# Add attributes to User
class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country, :string
    add_column :users, :bio, :string
    add_column :users, :social_link, :string, array: true, default: []
    add_column :users, :website_link, :string
  end
end

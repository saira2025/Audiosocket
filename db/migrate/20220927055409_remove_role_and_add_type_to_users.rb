# frozen_string_literal: true

# remove role and add type
class RemoveRoleAndAddTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role, :integer
    add_column :users, :type, :string, default: 'Artist'
  end
end

# frozen_string_literal: true

# add status  to audition
class AddStatusToAudition < ActiveRecord::Migration[5.2]
  def change
    add_column :auditions, :status, :integer, default: 0
  end
end

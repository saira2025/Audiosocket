# frozen_string_literal: true

# add Additional info
class AddAdditionalinfoToAudition < ActiveRecord::Migration[5.2]
  def change
    add_column :auditions, :additional_info, :text
  end
end

# frozen_string_literal: true

# remove col from audition
class RemoveAboutUseFromAudition < ActiveRecord::Migration[5.2]
  def change
    remove_column :auditions, :about_us, :String
  end
end

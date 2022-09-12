# frozen_string_literal: true

# remove about os from audition
class RemoveAboutUsFromAudition < ActiveRecord::Migration[5.2]
  def change
    remove_column :auditions, :about_us, :integer
  end
end

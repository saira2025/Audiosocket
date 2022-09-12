# frozen_string_literal: true

# Add coloum to audition
class AddAboutUstoAudition < ActiveRecord::Migration[5.2]
  def change
    add_column :auditions, :about_us, :string
  end
end

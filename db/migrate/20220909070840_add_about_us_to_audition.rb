# frozen_string_literal: true

# Add about us to audition
class AddAboutUsToAudition < ActiveRecord::Migration[5.2]
  def change
    add_column :auditions, :about_us, :Integer
  end
end

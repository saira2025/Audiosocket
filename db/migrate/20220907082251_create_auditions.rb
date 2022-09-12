# frozen_string_literal: true

# Create Audition
class CreateAuditions < ActiveRecord::Migration[5.2]
  def change
    create_table :auditions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :artist_name
      t.integer :genre
      t.string :about_us

      t.timestamps
    end
  end
end

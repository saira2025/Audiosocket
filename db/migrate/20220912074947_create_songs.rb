# frozen_string_literal: true

# Create Songs
class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :link
      t.references :audition, foreign_key: true

      t.timestamps
    end
  end
end

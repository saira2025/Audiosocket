# frozen_string_literal: true
# create Tracks
class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name

      t.timestamps
    end
  end
end

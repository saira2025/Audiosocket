# frozen_string_literal: true
# Add album reference to track
class Addalbumrefernecetotrack < ActiveRecord::Migration[5.2]
  def change
    add_reference :tracks, :album, foreign_key: true
  end
end

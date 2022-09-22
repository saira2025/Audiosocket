# frozen_string_literal: true

# Audition model
require 'csv'
# Audition model
class Audition < ApplicationRecord
  has_many :songs, inverse_of: :audition
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
  paginates_per 14
  # Enums for genre
  enum genre: %i[Acapella Acid Jazz Acoustic Acid_Punk Alternative Hip_Hop Ambient Avantgarde Bass Blues Cabaret
                 Celtic_Chamber Chanson Chorus Christian_Rap Cinematic Classical Classic_Rock Club Comedy Country Cult]
  enum status: %i[pending accepted rejected deleted]

  # validation
  validate do
    errors.add(:base, 'maximum four songs are allowed.') if songs.reject(&:marked_for_destruction?).length > 4
  end

  # method for Csv parsing
  def self.to_csv
    attributes = %w[id first_name artist_name email genre status]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |audition|
        csv << attributes.map { |attr| audition.send(attr) }
      end
    end
  end
end

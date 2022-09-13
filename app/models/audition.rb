# frozen_string_literal: true

# Audition model
class Audition < ApplicationRecord
  paginates_per 14
  # Enums for genre
  enum genre: %i[Acapella Acid Jazz Acoustic Acid_Punk Alternative Hip_Hop Ambient Avantgarde Bass Blues Cabaret
                 Celtic_Chamber Chanson Chorus Christian_Rap Cinematic Classical Classic_Rock Clu0b Comedy Country Cult]
  enum status: %i[pending accepted rejected deleted]
end

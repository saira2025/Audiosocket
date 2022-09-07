# frozen_string_literal: true

# Audition model
class Audition < ApplicationRecord
  # Enums for genre
  enum genre: %i[Acapella Acid Jazz Acoustic Acid_Punk Alternative Hip_Hop Ambient Avantgarde Bass Blues Cabaret
                 Celtic_Chamber Chanson Chorus Christian_Rap Cinematic Classical Classic_Rock Club Comedy Country Cult]
end

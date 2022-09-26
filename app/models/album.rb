# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
end

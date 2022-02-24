# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :players
  has_many :participants
  has_many :competitions, through: :participants
end

class Competition < ApplicationRecord
  has_many :participants
  has_many :teams, through: :participants
end

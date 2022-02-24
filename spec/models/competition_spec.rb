# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:participants) }
    it { should have_many(:teams).through(:participants) }
  end

  before :each do
    comp1 = Competition.create!(name: 'World Cup', location: 'Qatar', sport: 'Soccer')
    comp2 = Competition.create!(name: 'Olympics', location: 'Sochi', sport: 'Many')
    team1 = Team.create!(hometown: 'England', nickname: 'The Three Lions')
    team2 = Team.create!(hometown: 'USA', nickname: 'USMNT')
    team3 = Team.create!(hometown: 'New Jersey Devils', nickname: 'Devils')
    player1 = team1.players.create!(name: 'Marcus Rashford', age: 21)
    player2 = team1.players.create!(name: 'Jadon Sancho', age: 20)
    player3 = team2.players.create!(name: 'Christian Pulisic', age: 21)
    player4 = team2.players.create!(name: 'Sergino Dest', age: 19)
    player5 = team3.players.create!(name: 'Jack Hughes', age: 19)
    player6 = team3.players.create!(name: 'Nico Hischier', age: 22)
    par1 = Participant.create!(team_id: team1.id, competition_id: comp1.id)
    par2 = Participant.create!(team_id: team1.id, competition_id: comp2.id)
    par3 = Participant.create!(team_id: team2.id, competition_id: comp1.id)
    par4 = Participant.create!(team_id: team2.id, competition_id: comp2.id)
    par5 = Participant.create!(team_id: team3.id, competition_id: comp1.id)
    par6 = Participant.create!(team_id: team3.id, competition_id: comp2.id)
  end

  describe 'average age for players' do
    it '#average_player_age' do
      expect(comp1.average_player_age.round(2)).to eq(20.33)
    end
  end
end

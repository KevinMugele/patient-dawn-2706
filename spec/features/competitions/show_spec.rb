# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Competition Show' do
  before :each do
    @comp1 = Competition.create!(name: 'World Cup', location: 'Qatar', sport: 'Soccer')
    @comp2 = Competition.create!(name: 'Olympics', location: 'Sochi', sport: 'Many')
    @team1 = Team.create!(hometown: 'England', nickname: 'The Three Lions')
    @team2 = Team.create!(hometown: 'USA', nickname: 'USMNT')
    @team3 = Team.create!(hometown: 'New Jersey Devils', nickname: 'Devils')
    @player1 = @team1.players.create!(name: 'Marcus Rashford', age: 21)
    @player2 = @team1.players.create!(name: 'Jadon Sancho', age: 20)
    @player3 = @team2.players.create!(name: 'Christian Pulisic', age: 21)
    @player4 = @team2.players.create!(name: 'Sergino Dest', age: 19)
    @player5 = @team3.players.create!(name: 'Jack Hughes', age: 19)
    @player6 = @team3.players.create!(name: 'Nico Hischier', age: 22)
    @par1 = Participant.create!(team_id: @team1.id, competition_id: @comp1.id)
    @par2 = Participant.create!(team_id: @team1.id, competition_id: @comp2.id)
    @par3 = Participant.create!(team_id: @team2.id, competition_id: @comp1.id)
    @par4 = Participant.create!(team_id: @team2.id, competition_id: @comp2.id)
    @par5 = Participant.create!(team_id: @team3.id, competition_id: @comp1.id)
    @par6 = Participant.create!(team_id: @team3.id, competition_id: @comp2.id)
  end

  describe 'user story 2' do
    it 'shows a competitions details' do
      visit competition_path(@comp1)

      expect(page).to have_content(@comp1.name)
      expect(page).to have_content(@comp1.location)
      expect(page).to have_content(@comp1.sport)
    end

    it 'shows all of a competitions teams hometown and nicknames' do
      visit competition_path(@comp1)

      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team2.hometown)
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team3.hometown)
      expect(page).to have_content(@team3.nickname)
    end

    it 'shows the average age of players in the competition' do
      visit competition_path(@comp1)

      expect(page).to have_content(@comp1.average_player_age.round(1))
    end
  end

  describe 'user story 3' do
    it 'allows user to register a team' do
      visit competition_path(@comp1)

      expect(page).to have_link('Register a New Team')
      click_link 'Register a New Team'

      expect(current_path).to eq("/competitions/#{@comp1.id}/participants/new")
    end

    it 'has a form for a new team' do
      visit "/competitions/#{@comp1.id}/participants/new"

      expect(page).to have_field('Nickname')
      expect(page).to have_field('Hometown')
      expect(page).to have_button('Submit')

      fill_in('Nickname', with: 'Spartans')
      fill_in('Hometown', with: 'Sparta')
      click_button 'Submit'

      expect(current_path).to eq(competition_path(@comp1))
      expect(page).to have_content('Spartans')
    end
  end
end

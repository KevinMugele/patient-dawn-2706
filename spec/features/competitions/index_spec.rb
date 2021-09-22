require 'rails_helper'

RSpec.describe 'Competition Index' do
  before :each do
    @comp1 = Competition.create!(name: "World Cup", location: "Qatar", sport: "Soccer")
    @comp2 = Competition.create!(name: "Olympics", location: "Sochi", sport: "Many")
    @team1 = Team.create!(hometown: "England", nickname: "The Three Lions")
    @team2 = Team.create!(hometown: "USA", nickname: "USMNT")
    @team3 = Team.create!(hometown: "New Jersey Devils", nickname: "Devils")
    @player1 = @team1.players.create!(name: "Marcus Rashford", age: 21)
    @player2 = @team1.players.create!(name: "Jadon Sancho", age: 20)
    @player3 = @team2.players.create!(name: "Christian Pulisic", age: 21)
    @player4 = @team2.players.create!(name: "Sergino Dest", age: 19)
    @player5 = @team3.players.create!(name: "Jack Hughes", age: 19)
    @player6 = @team3.players.create!(name: "Nico Hischier", age: 22)
    @par1 = Participant.create!(team_id: @team1.id, competition_id: @comp1.id)
    @par2 = Participant.create!(team_id: @team1.id, competition_id: @comp2.id)
    @par3 = Participant.create!(team_id: @team2.id, competition_id: @comp2.id)
    @par4 = Participant.create!(team_id: @team2.id, competition_id: @comp2.id)
    @par5 = Participant.create!(team_id: @team3.id, competition_id: @comp1.id)
    @par6 = Participant.create!(team_id: @team3.id, competition_id: @comp1.id)
  end

  describe 'user story 1' do
    it 'shows the names of all competitions on competition index page' do
      visit competitions_path

      expect(page).to have_content(@comp1.name)
      expect(page).to have_content(@comp2.name)
    end

    xit 'shows the names of all competitions as links to show page on competition index page' do
      visit competitions_path

      expect(page).to have_link(@comp1.name)
      expect(page).to have_link(@comp2.name)
    end

    xit 'brings you to a competitions show page if you click link' do
      visit competitions_path

      click_link "#{@comp1.name}"

      expect(current_path).to eq(competition_path(@comp1))
      expect(page).to have_content(@comp1.name)
    end
  end
end

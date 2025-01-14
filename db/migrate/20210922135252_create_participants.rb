# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :competition, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end

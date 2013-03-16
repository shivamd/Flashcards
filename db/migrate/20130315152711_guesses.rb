class Guesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.boolean :correct, null: true
      t.references :card, :round
      t.timestamps
    end
  end
end

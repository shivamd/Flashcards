class Rounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user, :deck
      t.timestamps
    end
  end
end

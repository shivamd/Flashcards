class Rounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user
      t.timestamps
    end
  end
end

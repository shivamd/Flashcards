class Cards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :deck
      t.text :question, null: false
      t.text :answer, null: false
      t.timestamps
    end
  end
end

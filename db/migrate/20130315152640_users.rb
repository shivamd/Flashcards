class Users < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name, null: false
  		t.string :email, null: false
  		t.string :password_hash
  	end
  end
end

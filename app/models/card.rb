class Card < ActiveRecord::Base

  has_many :guesses
  belongs_to :decks
  
  # Remember to create a migration!
end


require 'csv'

file = 'public/card_data/jeopardy.csv'
jeopardy = Deck.create(:topic => "Jeopardy")
CSV.foreach(file, :headers => true) do |card_data|
  data = Hash[card_data.to_a.map {|k, v| [k.to_sym, v]}]
  jeopardy.cards.create(:question    => data[:question],
                        :answer      => data[:answer])
end


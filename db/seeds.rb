require 'csv'

file = 'public/jeopardy.csv'
jeopardy = Deck.create(:name => "Jeopardy")
CSV.foreach(file, :headers => true) do |card_data|
  data = Hash[card_data.to_a.map {|k, v| [k.to_sym, v]}]
  jeopardy.cards.create(:question    => data[:question],
                        :answer      => data[:answer])
end


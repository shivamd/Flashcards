post '/round' do
  session[:round] = Deck.find(params[:deck_id])
  #params.inspect { deck => 1 }
  #current_user.rounds.create

  #redirect to '/deck/#{ session[:round].id }/card/1'

end

get '/deck/:deck_id/card/:card_id/' do
  
  #erb :flashcard_game_question
end 

post '/deck/:deck_id/card/guess' do
    # card = session[:round].next
    # if params[:guess] == card.answer
    #   @message = 'correct!'
    #   get_next_card = card.id + 1
    #   if card.exists?

    #   redirect '/deck/:deck_id/card/' + params[:card_id].t/'
    # else

    # end
end




get '/game/1/question/1' do
  erb :flashcard_game_question
end

get '/game/1/question/1/guess' do
  erb :flashcard_game_answer
end

get '/game/1/done' do
  erb :game_stats
end

#/user

#/game/1

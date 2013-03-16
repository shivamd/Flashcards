post '/rounds' do
  #params.inspect

   "#{Deck.find_by_name(params[:deck]).cards}"
  
   
   session[:cards] = []
    Deck.find_by_name(params[:deck]).cards.each do |card|
      session[:cards] << card.id
    end
  #params.inspect { deck => 1 }
  #current_user.rounds.create

  
  redirect to '/deck/cards/' + Card.find_by_id(session[:cards].pop).id.to_s
end

get '/deck/cards/:card_id' do

  @card = Card.find_by_id(params[:card_id])
  erb :flashcard_game_question
end 

post '/deck/cards/:card_id/guess' do
    @card = Card.find_by_id(params[:card_id])
    @user_guess = params[:submit_guess]
    @guess = params[:submit_guess] == @card.answer
    @card.guesses.create(correct: @guess) 
    @answer = @card.answer
   
    erb :flashcard_game_answer
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



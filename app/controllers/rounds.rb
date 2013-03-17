post '/rounds' do
  session[:cards] = []
  current_deck = Deck.find_by_name(params[:deck])

  current_deck.cards.each do |card|
    session[:cards] << card.id
  end
  current_round = current_user.rounds.create(:deck_id => current_deck.id)
  redirect to "/round/#{current_round.id}/deck/#{current_deck.id}/cards/" + Card.find_by_id(session[:cards].pop).id.to_s
end

get '/round/:round_id/deck/:deck_id/cards/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:round_id])
  @card = Card.find_by_id(params[:card_id])
  erb :flashcard_game_question
end 

post '/round/:round_id/deck/:deck_id/cards/:card_id/guess' do
    @card = Card.find_by_id(params[:card_id])
    @user_guess = params[:submit_guess]
    @guess = @user_guess == @card.answer
    @round = Round.find(params[:round_id])
    @card.guesses.create(correct: @guess, round_id: @round.id) 
    @answer = @card.answer
    @deck = Deck.find(params[:deck_id])
    
    erb :flashcard_game_answer
  
end


get '/results/:round_id' do
  session[:card] = nil
  @round = Round.find(params[:round_id])
  @round_stats = Guess.where("round_id = ?",@round.id)
  erb :game_stats
end





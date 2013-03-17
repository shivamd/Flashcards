helpers do 

  def round_stats(round_id)
    round_stats = Guess.where("round_id = ?", round_id)
  end

  def percentage_correct(round_stats)
    "%.2f" % ((round_stats.select { |x| x.correct }.count.to_f / round_stats.length) * 100).to_s
  end

  def correct(round_stats)
    round_stats.select { |x| x.correct }.count
  end

  def wrong(round_stats)
    round_stats.select { |x| !x.correct }.count
  end

end


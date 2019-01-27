class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet,fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def pay(amt_to_pay)
    if sufficient_funds(amt_to_pay)
      @wallet -= amt_to_pay
    end
  end

  def sufficient_funds(amt_to_pay)
    return amt_to_pay <= @wallet
  end



end

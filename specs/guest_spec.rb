require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Pauline", 20, "Now we are Free" )
    @guest2 = Guest.new("Sheila", 60, "A Horse with No Name" )
    @guest3 = Guest.new("Dan", 30, "Walk this Way" )
  end

  def test_guest_has_name
    assert_equal("Pauline", @guest1.name)
  end

  def test_guest_has_wallet
    assert_equal(20, @guest1.wallet)
  end

  def test_guest_has_fav_song
    assert_equal("Now we are Free", @guest1.fav_song)
  end

  def test_pay__enough_money
    @guest2.pay(50)
    assert_equal(10, @guest2.wallet)
  end

  def test_pay__not_enough_money
    @guest3.pay(50)
    assert_equal(30, @guest3.wallet)
  end


end

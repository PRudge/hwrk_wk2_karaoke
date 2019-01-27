require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative("../song")
require_relative("../guest")

class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Bohemian Rhapsody")
    @song2 = Song.new("Now we are Free")
    @song3 = Song.new("Born to Run")

    @songs = [@song1, @song2, @song3]

    # anew song to add
    @song4 = Song.new("Bad Moon Rising")

    @guest1 = Guest.new("Pauline Smith", 20, "Now we are Free" )
    @guest2 = Guest.new("Brogan Jones", 20, "Bohemian Rhapsody" )
    @guest3 = Guest.new("Maddy McLaughlin", 20, "Call Me" )

    @guests = [@guest1, @guest2, @guest3]

    # new guests to check in
    @guest4 = Guest.new("Dan Rudge", 20, "Who wants to live forever")
    @guest5 = Guest.new("Sheila McTavish", 60, "A Horse with No Name" )

    @room = Room.new("Freddie Mercury Room", @guests, @songs,  4, 25)
    @room2 = Room.new("Prince Room", @guests, @songs,  @guests.length, 25)
  end

  def test_room_has_name
    assert_equal("Freddie Mercury Room", @room.name())
  end

  def test_room_has_guests
    assert_equal(@guests, @room.guests())
  end

  def test_room_has_songs
    assert_equal(@songs, @room.songs())
  end

  def test_room_has_room_capacity
    assert_equal(4, @room.room_capacity())
  end

  def test_room_has_fee
    assert_equal(25, @room.fee())
  end

  def test_check_in_guest
    @room.check_in_guest(@guest4)
    assert_equal(4, @guests.length)
  end
  #
  def test_check_out_guest__guest_exists
    @room.check_out_guest(@guest2)
    assert_equal(2, @guests.length)
  end

  def test_check_out_guest__guest_doesnt_exist
    @room.check_out_guest(@guest5)
    assert_equal(3, @guests.length)
  end

  def test_check_room_full__true
    result = @room2.check_room_full()
    assert_equal(true, result)
  end

  def test_check_room_full__false
    result = @room.check_room_full()
    assert_equal(false, result )
  end

  def test_take_fee__true
    @room.pay_dues(@guest5, 25)
    assert_equal(35, @guest5.wallet)
  end

  def test_take_fee__false
    @room.pay_dues(@guest4, 25)
    assert_equal(20, @guest4.wallet)
  end

  # def test_add_a_guest__no_room
  #   result = @room2.add_a_guest(@guest4)
  #   assert_equal(3, @guests.length)
  # end

  def test_add_a_guest__no_money_but_room
    result = @room.add_a_guest(@guest4)
    assert_equal(3, @guests.length)
  end

  # def test_add_a_guest__with_money_and_there_is_space
  #   @room.add_a_guest(@guest5)
  #   assert_equal(4, @guests.length)
  # end

  def test_add_song__true
    @room.add_new_song(@song4)
    assert_equal(4, @songs.length)
  end

  def test_add_song__false
    @room.add_new_song(@song2)
    assert_equal(3, @songs.length)
  end

  def test_favourite_song__true
    result = @room.favourite_song(@guest1)
    assert_equal("Whoo!", result)
  end

  def test_favourite_song__false
    result = @room.favourite_song(@guest5)
    assert_equal("not found" , result)
  end

end

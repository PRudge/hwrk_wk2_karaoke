require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative("../song")
require_relative("../guest")
require_relative("../bar")

class BarTest < MiniTest::Test
  def setup

# this is what I want my hash to look like
    guest_tabs_tryout = [
      {
        :room => "Freddie Mercury Room",
        :guests => [
          {:name =>"Brogan Jones", :tab=>70},
          {:name=>"Dan Rudge", :tab=>65}
        ]
      },
      {
        :room => "Prince Room",
        :guests => [
          {:name =>"Pauline Jones", :tab=>70},
          {:name=>"Sheila McTavish", :tab=>65}
        ]
      }
    ]

    @song1 = Song.new("Bohemian Rhapsody")
    @song2 = Song.new("Now we are Free")
    @song3 = Song.new("Born to Run")

    @songs1 = [@song1, @song2, @song3]

    @song4 = Song.new("Bad Moon Rising")
    @song5 = Song.new("Call Me")
    @song6 = Song.new("Born to be Wild")
    @song7 = Song.new("November Rain")

    @songs2 = [@song1,@song4, @song5, @song6, @song7]

    @guest1 = Guest.new("Pauline Smith", 20, "Now we are Free" )
    @guest2 = Guest.new("Brogan Jones", 20, "Bohemian Rhapsody" )
    @guest3 = Guest.new("Maddy McLaughlin", 20, "Call Me" )

    @guests1 = [@guest1, @guest2, @guest3]

    # new guests to check in
    @guest4 = Guest.new("Dan Rudge", 20, "Who wants to live forever")
    @guest5 = Guest.new("Sheila McTavish", 60, "A Horse with No Name")

    @guests2 = [@guest4, @guest5]

    @room1 = Room.new("Freddie Mercury Room", @guests1, @songs1,  4, 25)
    @room2 = Room.new("Prince Room", @guests2, @songs2,  @guests2.length, 25)
    @rooms = [@room1, @room2]

    @bar = Bar.new(@room1, 2000, @guest_tabs)
    @bar2 = Bar.new(@room2, 2000, @guest_tabs)

    @guest_tabs = []
  end

  def test_room_have_names
    assert_equal(@room1, @bar.room)
  end

  def test_till_has_money
    assert_equal(2000, @bar.till)
  end

  def test_guest_tabs
    assert_equal(@guest_tabs, @bar.guest_tabs)
  end

  def test_add_till_checked_in__true
    @bar.add_a_guest_to_room(@guest5)
    assert_equal(2025, @bar.till)
    assert_equal([{:room=>"Freddie Mercury Room",:name=>"Sheila McTavish", :tab=>25}], @guest_tabs)
  end

  def test_add_till_checked_in__false
    @bar.add_a_guest_to_room(@guest4)
    assert_equal(2000, @bar.till)
  end

  def test_set_up_tab
    @bar.update_tab(@guest4, 20)
    assert_equal([{:room=>"Freddie Mercury Room", :name=>"Dan Rudge", :tab=>20}], @guest_tabs)
    @bar.update_tab(@guest4, 45)
    assert_equal([{:room=>"Freddie Mercury Room",:name=>"Dan Rudge", :tab=>65}], @guest_tabs)
    @bar.update_tab(@guest2, 70)
    guest_tab_array = [{:room=>"Freddie Mercury Room", :name=>"Dan Rudge", :tab=>65}, {:room=>"Freddie Mercury Room", :name=>"Brogan Jones", :tab=>70}]
    assert_equal(guest_tab_array, @guest_tabs)
    @bar2.update_tab(@guest1, 70)
    guest_tab_array = [{:room=>"Freddie Mercury Room",
      :name=>"Dan Rudge", :tab=>65},
      {:room=>"Freddie Mercury Room", :name=>"Brogan Jones", :tab=>70},
      {:room=>"Prince Room", :name=>"Pauline Smith", :tab=>70}]
      assert_equal(guest_tab_array, @guest_tabs)
    end

    # as guests check_out check their tab and see if they have enough money to pay it...

    # def test_enough_funds__true
    #   guest_tab_array = [{:room=>"Freddie Mercury Room",
    #     :name=>"Dan Rudge", :tab=>65},
    #     {:room=>"Freddie Mercury Room", :name=>"Brogan Jones", :tab=>70},
    #     {:room=>"Prince Room", :name=>"Pauline Smith", :tab=>70}]
    #     result = @bar.funds(guest_tab_array)
    # end


  end

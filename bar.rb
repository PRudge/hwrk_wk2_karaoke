class Bar

  attr_reader :room, :till, :guest_tabs

  def initialize(room, till, guest_tabs)
    @room = room
    @till = till
    @guest_tabs = guest_tabs
  end

  def add_a_guest_to_room(guest_name)
    if @room.add_a_guest(guest_name)
      @till += @room.fee
      update_tab(guest_name, @room.fee)
    end
  end

  # I want the hash to look like guest_tabs_tryout in setup. 
  def update_tab(guest, amt_owed)
    @guest_tabs.find { |guest_tb| return guest_tb[:tab] += amt_owed if guest_tb[:name] == guest.name}
    guest_tab = {room: @room.name, name: guest.name, tab: amt_owed}
    # guest_tab = {room: @room.name, name: guest.name, tab: amt_owed}
    @guest_tabs << guest_tab
  end

end

# Note: wasn't sure if there should be an array of rooms in the bar, or if
# it's better to pass in each one separately...
# Make another class with drinks
#
# When a guest checks out make them pay their tab, take money out of their test_guest_has_wallet
# makr them wash dishes if they don't have enough money

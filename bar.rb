class Bar

  attr_reader :room, :till, :guest_tabs
  attr_writer :guest_tabs

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

  def update_tab(guest, amt_owed)
    @guest_tabs.find { |guest_tb| return guest_tb[:tab] += amt_owed if guest_tb[:name] == guest.name}
    guest_tab = {room: @room.name, name: guest.name, tab: amt_owed}
    @guest_tabs << guest_tab
  end


  def try_larger_hash(guest, amt_owed)
    @guest_tabs.find do |karaoke_room|
      if karaoke_room[:room] == @room.name
        karaoke_room[:guests].find {|guest_tb| guest_tb[:tab] += amt_owed if guest_tb[:name] == guest.name}
        return :guests => [
           {:name =>guest.name, :tab=>amt_owed}]
      end
    end
    guest_tab = {:room => @room.name,
            :guests => [
               {:name =>guest.name, :tab=>amt_owed}]}
    @guest_tabs << guest_tab
  end

end

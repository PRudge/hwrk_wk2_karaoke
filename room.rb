class Room

  attr_reader :name, :guests, :songs, :room_capacity, :fee

  def initialize(name, guests, songs, room_capacity, fee)
    @name = name
    @guests = guests
    @songs = songs
    @room_capacity = room_capacity
    @fee = fee
  end

  def add_a_guest(new_guest)
    return if check_room_full()
    return if !pay_dues(new_guest, @fee)
    check_in_guest(new_guest)
  end

  def check_in_guest(guest_check_in)
    @guests << guest_check_in
  end

  def check_out_guest(guest_check_out)
    if @guests.include?(guest_check_out)
      @guests.delete(@guests.find{|guest| guest.name == guest_check_out.name})
    end
  end

  def check_room_full()
    return @room_capacity <= @guests.length
  end

  def pay_dues(new_guest, amt)
    new_guest.pay(amt)
  end

  def add_new_song(new_song)
    @songs.push(new_song) unless @songs.include?(new_song)
  end

  def favourite_song(guest)
    @songs.find {|song| return "Whoo!" if song.name == guest.fav_song}
    return "not found"
  end

end

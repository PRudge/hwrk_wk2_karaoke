require("minitest/autorun")
require('minitest/rg')
require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song = Song.new("Bohemian Rhapsody")
  end

  def test_song_has_name
    assert_equal("Bohemian Rhapsody", @song.name())
  end

end

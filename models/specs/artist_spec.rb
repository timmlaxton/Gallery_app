require('minitest/autorun')
require('minitest/rg')
require_relative('../artist')

class TestArtist < Mintest::Test

  def setup
    @artist1 - Artist.new({'alias' => 'Frank Quietly'})
  end

  def test_alias()
    result = @artist1.alias
    assert_equal('Frank Quietly', result)
  end

end

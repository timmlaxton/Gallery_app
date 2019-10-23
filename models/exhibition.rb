require('minitest/autorun')
require('minitest/rg')
require_relative('../exhibition')

class TestExhibtion < MiniTest::Test

def setup
  @exhibtion1 = Exhibition.new({'title' => 'The Greens', 'catergory' => 'comicart'})
end

def test_title()
  result = @exhibition1.title
  assert_equall('The Greens', result)
end

def test_catergory()
  result = @exihibtion1.catergory
  assert_equal('comicart', result)
end


end

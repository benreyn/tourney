require 'test_helper'

class TourneyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tourney::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end

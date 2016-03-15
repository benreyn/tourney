require 'test_helper'

class TourneyTest < Minitest::Test
  def setup
    @tourney = Tournament.new(6)
  end

  def test_gem_has_a_version_number
    refute_nil ::Tourney::VERSION
  end

  def test_tournament_has_the_correct_number_of_rounds
    assert_equal @tourney.rounds, 3
  end

  def test_tournament_has_the_correct_number_of_byes
    assert_equal @tourney.byes, 2
  end

  def test_tournament_bracket_has_the_correct_number_of_matches
    assert_equal @tourney.matches, 2
  end

  def test_tournament_bracket_is_laid_out_properly
    assert_equal @tourney.bracket, [[1, :bye], [4, 5], [2, :bye], [3, 6]]
  end
end

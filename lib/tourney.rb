require "tourney/version"

class Tournament

  attr_reader :teams
  attr_reader :rounds
  attr_reader :byes

  def initialize(teams)

    @teams = teams

    rounds = 0
    while teams > 1
      teams /= 2
      rounds += 1
    end

    @rounds = rounds

    @byes = (2 ** @rounds) - @teams

  end

end

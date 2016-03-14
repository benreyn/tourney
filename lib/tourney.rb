require "tourney/version"

class Tournament

  attr_reader :teams
  attr_reader :rounds
  attr_reader :byes
  attr_reader :matches

  def initialize(teams)

    @teams = teams

    rounds = 0
    while teams > 1
      teams /= 2
      rounds += 1
    end

    @rounds = rounds

    @byes = @teams - (2 ** @rounds)
    seeds = (1..@teams).to_a

    @matches = []

    (0...@byes).each do |i|
      @matches.unshift([seeds.shift(), :bye])
    end

    while seeds.size > 0
      @matches.unshift([seeds.shift(), seeds.pop()])
    end

  end

end

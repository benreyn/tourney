require "tourney/version"

class Tournament

  attr_reader :teams
  attr_reader :rounds
  attr_reader :byes
  attr_reader :bracket

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

    (0...@byes).each do |i|
      seeds.push(:bye)
    end

    (@rounds).times do
      half = seeds.size / 2
      seeds = seeds[0, half].zip(seeds[half, half].reverse)
    end

    @bracket = seeds
  end

end

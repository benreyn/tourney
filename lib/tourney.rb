require "tourney/version"

class Tournament

  attr_reader :teams
  attr_reader :rounds
  attr_reader :byes
  attr_reader :matches
  attr_reader :bracket

  def initialize(teams)

    @teams = teams

    rounds = teams % 2 == 0 ? 0 : 1
    while teams > 1
      teams /= 2
      rounds += 1
    end

    @rounds = rounds
    next_pow_of_two = (2 ** @rounds)
    @byes = next_pow_of_two - @teams
    @matches = next_pow_of_two - @byes
    seeds = (1..@teams).to_a

    @byes.times { seeds.push(:bye) }

    (@rounds - 1).times do
      half = seeds.size / 2
      seeds = seeds[0, half].zip(seeds[half, half].reverse)
    end

    @bracket = seeds

  end

end

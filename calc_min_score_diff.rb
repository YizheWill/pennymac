class CalcMinScoreDiff
  attr_reader :team, :min_diff

  def initialize(file)
    @min_diff = 1.0 / 0.0
    @team
    data = File.readlines(file).collect do |line|
      arr = line.split(/\ +/)
      idx = arr.index("-")
      next if arr.count("-") != 1
      for_goal = arr[idx - 1].to_i
      against_goal = arr[idx + 1].to_i
      diff = (for_goal - against_goal).abs
      if diff < @min_diff
        @min_diff = diff
        @team = arr[2]
      end
    end
  end

  def calc_min_score_diff
    puts team
    puts min_diff
    return @min_spread_date
  end
end

cal = CalcMinScoreDiff.new("./soccer.dat")
cal.calc_min_score_diff

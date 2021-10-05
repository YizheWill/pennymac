class CalcMinScoreDiff
  def initialize(file)
    @min_diff = 1.0 / 0.0
    @team
    # read in the file and process the data
    data = File.readlines(file).collect do |line|
      arr = line.split(/\ +/)
      idx = arr.index("-")
      # eliminate invalid rows
      next if arr.count("-") != 1
      for_goal = arr[idx - 1].to_i
      against_goal = arr[idx + 1].to_i
      diff = (for_goal - against_goal).abs
      # found potential team, save team for later comparison
      if diff < @min_diff
        @min_diff = diff
        @team = arr[2]
      end
    end
    # @min_diff and @team with min_diff has been found
  end

  def calc_min_score_diff
    puts @team
    return @team
  end
end

cal = CalcMinScoreDiff.new("./soccer.dat")
cal.calc_min_score_diff

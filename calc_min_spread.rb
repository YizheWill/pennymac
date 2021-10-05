class CalcMinSpread
  def initialize(file)
    @min_spread_date
    min_spread = 1.0 / 0.0
    # read in the file and start processing
    data = File.readlines(file).collect do |line|
      _placeholder, date, max, min = line.split(/\ +/)
      date, max, min = date.to_i, max.to_i, min.to_i
      next if date == 0
      # find a potential min_spread date, save the min spread and the date
      if max - min < min_spread
        min_spread = max - min
        @min_spread_date = date
      end
    end
    # after running the initializer, min_spread_date has already been found
  end

  def calc_min
    puts @min_spread_date
    return @min_spread_date
  end
end

cal = CalcMinSpread.new("./w_data.dat")
cal.calc_min

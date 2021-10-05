class CalcMinSpread
  attr_accessor :data

  def initialize(file)
    @min_spread_date = -1
    min_spread = 1.0 / 0.0
    data = File.readlines(file).collect do |line|
      _, date, max, min = line.split(/\ +/)
      date, max, min = date.to_i, max.to_i, min.to_i
      next if date == 0
      if max - min < min_spread
        min_spread = max - min
        @min_spread_date = date
      end
    end
  end

  def calc_min
    puts @min_spread_date
    return @min_spread_date
  end
end

cal = CalcMinSpread.new("./w_data.dat")
cal.calc_min

# http://stackoverflow.com/questions/10045396/time-of-day-range-in-ruby
class TimeRange
  private

    def coerce(time)
      time.is_a? String and return time
      return time.strftime("%H:%M")
    end

  public

    def initialize(start,finish)
      @start = coerce(start)
      @finish = coerce(finish)
    end

    def include?(time)
      time = coerce(time)
      @start < @finish and return (@start..@finish).include?(time)
      return !(@finish..@start).include?(time)
    end
end

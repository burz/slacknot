class Problem < ActiveRecord::Base
  belongs_to :assignment
  has_many :time_intervals

  def time_elapsed
    if time_intervals.any?
      time_intervals.map { |t| (t.end - t.start).to_i }.inject(:+)
    else
      0
    end
  end

  def time_per_day_of_week
    times = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]
    time_intervals.each do |interval|
      if interval.start.yday == interval.end.yday
        c = times[interval.start.wday]
        c[0] += interval.end - interval.start
        c[1] += 1
      else
        place = interval.start + 1.day

        c = times[interval.start.wday]
        c[0] += place.midnight - interval.start
        c[1] += 1

        while(place.yday <= interval.end.yday)
          c = times[place.wday]

          if place.yday < interval.end.yday
            c[0] += 86400
            c[1] += 1
          else
            c[0] += interval.end - place.midnight
            c[1] += 1
          end

          place += 1.day
        end
      end
    end
    times
  end
end

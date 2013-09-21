class Problem < ActiveRecord::Base
  belongs_to :assignment
  has_many :time_intervals

  def time_elapsed
    if time_intervals.any?
      time_intervals.map { |t| t.start - t.end }.inject(:+)
    else
      Time.new 0
    end
  end
end

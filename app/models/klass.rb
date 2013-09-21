class Klass < ActiveRecord::Base
  belongs_to :user
  has_many :assignments

  def time_elapsed
    if assignments.any?
      assignments.map { |a| a.time_elapsed }.inject(:+)
    else
      0
    end
  end

  def average_time_per_problem
    if assignments.any?
      times = assignments.map { |a| a.problem_time }.inject([0, 0]) do |sum, t|
        [sum[0] + t[0], sum[1] + t[1]]
      end
      times[0] / times[1]
    else
      0
    end
  end

  def average_time_per_assignment
    if assignments.any?
      assignments.map { |a| a.problem_time[0] }.inject(:+) / assignments.count
    else
      0
    end
  end
end

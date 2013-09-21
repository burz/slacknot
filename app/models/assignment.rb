class Assignment < ActiveRecord::Base
  belongs_to :klass
  has_many :problems

  def time_elapsed
    if problems.any?
      problems.map { |p| p.time_elapsed.to_i }.inject(:+)
    else
      0
    end
  end

  def completed
    if problems.any?
      100 * problems.map { |p| p.completed ? 1 : 0 }.inject(:+) / problems.count
    else
      100
    end
  end
end

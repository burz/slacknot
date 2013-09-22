class DueDateOrderValidator < ActiveModel::Validator
  def validate(record)
    if record.due_on < record.assigned_on
      record.errors[:base] << 'The due date cannot come before the assigned on date'
    end
  end
end

class Assignment < ActiveRecord::Base
  belongs_to :klass
  has_many :problems

  validates :name, presence: true
  validates_with DueDateOrderValidator

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

  def problem_time
    if problems.any?
      [problems.map { |p| p.time_elapsed.to_i }.inject(:+), problems.count]
    else
      [0, 0]
    end
  end

  def time_per_day_of_week
    if problems.any?
      times = [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]

      problems.each do |p|
        p.time_per_day_of_week.each_with_index do |t, i|
          times[i][0] += t[0]
          times[i][1] += t[1]
        end
      end
      times
    else
      [[0, 0]] * 7
    end
  end
end

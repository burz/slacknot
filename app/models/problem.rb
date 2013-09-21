class Problem < ActiveRecord::Base
  belongs_to :assignment
  has_many :time_intervals
end

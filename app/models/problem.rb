class Problem < ActiveRecord::Base
  belongs_to :assignment
  has_many :time_intervals

  def time_elapsed
    #default for now
    Time.now
  end
end

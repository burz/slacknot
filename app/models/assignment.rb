class Assignment < ActiveRecord::Base
  belongs_to :klass
  has_many :problems
end

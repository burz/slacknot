class UsersController < ApplicationController
  def pipeline
    @entries = Problem.joins(:assignment).where("assignments.due_on > ?", Time.now).
      where(completed: false).order("due_on ASC")
  end
end

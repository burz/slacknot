class ProblemsController < ApplicationController
  before_action :set_user_klass_assignment
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def create
    @problem = @assignment.problems.new(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to user_klass_assignment_problem_path(
                          @user, @klass, @assignment, @problem),
                        notice: 'Problem was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to user_klass_assignment_problem_path(
                          @user, @klass, @assignment, @problem),
                        notice: 'Problem was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to user_klass_assignment_problems_path(
                      @user, @klass, @assignment) }
    end
  end

  private
    def set_user_klass_assignment
      @user = User.find params[:user_id]
      @klass = Klass.find params[:klass_id]
      @assignment = Assignment.find params[:assignment_id]
    end

    def set_problem
      @problem = Problem.find(params[:id])
    end

    def problem_params
      params.require(:problem).permit(:prompt, :text, :latex, :notes, :completed)
    end
end
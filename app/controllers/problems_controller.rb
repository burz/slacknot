class ProblemsController < ApplicationController
  before_action :set_user_klass_assignment
  before_filter :ensure_owner
  before_action :set_problem, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:time]

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

  def time
    @problem = @assignment.problems.find params[:problem_id]

    results = JSON.parse(request.body.read)

    @problem.time_intervals.create start: Time.at(results['start']),
                                   end: Time.at(results['end'])

    render nothing: true
  end

  def view
    @problem = @assignment.problems.find params[:problem_id]

    render layout: 'preview', formats: [:pdf]
  end

  def create
    @problem = @assignment.problems.new(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to user_klass_assignment_path(
                          @user, @klass, @assignment),
                        notice: 'Problem was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @problem.update(problem_params)
        if @problem.completed
          format.html { redirect_to user_klass_assignment_problem_path(
                            @user, @klass, @assignment, @problem),
                          notice: 'Problem was successfully updated.' }
        else
          format.html { redirect_to edit_user_klass_assignment_problem_path(
                            @user, @klass, @assignment, @problem),
                          notice: 'Problem was successfully updated.' }
        end
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
      @klass = @user.klasses.find params[:klass_id]
      @assignment = @klass.assignments.find params[:assignment_id]
    end

    def set_problem
      @problem = @assignment.problems.find params[:id]
    end

    def problem_params
      params.require(:problem).permit :prompt, :text, :latex, :notes, :completed, :label
    end
end

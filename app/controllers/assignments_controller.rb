class AssignmentsController < ApplicationController
  before_action :set_user_klass
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def show
    @problems = @assignment.problems
  end

  def new
    @assignment = Assignment.new
  end

  def edit
  end

  def create
    @assignment = @klass.assignments.new assignment_params

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to user_klass_assignment_path(@user, @klass, @assignment),
                        notice: 'Assignment was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to user_klass_assignment_path(@user, @klass, @assignment),
                        notice: 'Assignment was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to user_klass_assignments_path(@user, @klass) }
    end
  end

  private
    def set_user_klass
      @user = User.find params[:user_id]
      @klass = Klass.find params[:klass_id]
    end

    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:name, :assigned_on, :due_on)
    end
end
